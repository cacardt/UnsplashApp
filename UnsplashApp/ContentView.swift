//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    
    // Déclaration d'une variable d'état, une fois remplie, elle va modifier la vue
    @State var imageList: [UnsplashPhoto] = []
    
    // Déclaration d'une fonction asynchrone
    func loadData() async {
        // Créez une URL avec la clé d'API
        let url = URL(string: "https://api.unsplash.com/photos?client_id=\(ConfigurationManager.instance.plistDictionnary.clientId)")!
        
        do {
            // Créez une requête avec cette URL
            let request = URLRequest(url: url)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
            
            // Mettez à jour l'état de la vue
            imageList = deserializedData
            
        } catch {
            print("Error: \(error)")
        }
    }
    var body: some View {
        Button(action: {
            Task {
                await loadData()
            }
        }, label: {
            Text("Load Data")
        })
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible(minimum: 150)), GridItem(.flexible(minimum: 150))], content: {
                    
                    ForEach(imageList, id: \.self) {image in
                        AsyncImage(url: URL(string: "\(image.urls.full)")) { image in
                            image.centerCropped().cornerRadius(12)
                        } placeholder: {
                            ProgressView()
                        }.frame(height: 150)
                    }
                })
            }
            .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .circular))
            .padding(Edge.Set.horizontal, 12)
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    ContentView()
}

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
    }
}

struct UnsplashPhoto: Codable, Identifiable, Hashable, Equatable {
    let id, slug: String
    let urls: Urls
    let user: User
}

struct Urls: Codable, Hashable, Equatable {
    let raw, full, regular, small: String
    let thumb, smallS3: String
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

struct User: Codable, Identifiable, Hashable, Equatable {
    let id, username: String
}
