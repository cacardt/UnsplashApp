//
//  FeedState.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/24/24.
//

import Foundation

class FeedState: ObservableObject {
    let unsplashAPI : UnsplashAPI = UnsplashAPI()
    
    @Published var homeFeed: [UnsplashPhoto]?
    @Published var topics: [Topic]?
    @Published var topicPics: [UnsplashPhoto]?
    @Published var picture: UnsplashPhoto?
    
    func fetchHomeFeed() async {
        do {
            guard let url = unsplashAPI.getAllPhotos() else {
                return
            }
            
            // Créez une requête avec cette URL
            let request = URLRequest(url: url)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
            
            // Mettez à jour l'état de la vue
            await MainActor.run{ homeFeed = deserializedData }
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchTopics() async {
        do {
            
            guard let url = unsplashAPI.getAllTopics() else {
                return
            }
            // Créez une requête avec cette URL
            let request = URLRequest(url: url)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([Topic].self, from: data)
            
            // Mettez à jour l'état de la vue
            await MainActor.run { topics = deserializedData }
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchTopicPictures(id: String) async {
        do {
            
            guard let url = unsplashAPI.getTopicPictures(id: id) else {
                return
            }
            // Créez une requête avec cette URL
            let request = URLRequest(url: url)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
            
            // Mettez à jour l'état de la vue
            await MainActor.run { topicPics = deserializedData }
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchPictureFromTopic(id: String) async {
        do {
            
            guard let url = unsplashAPI.getPictureFromTopic(id: id) else {
                return
            }
            // Créez une requête avec cette URL
            let request = URLRequest(url: url)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode(UnsplashPhoto.self, from: data)
            
            // Mettez à jour l'état de la vue
            await MainActor.run { picture = deserializedData }
            
        } catch {
            print("Error: \(error)")
        }
    }
}
