//
//  UnsplashAPI.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/24/24.
//

import Foundation

struct UnsplashAPI {
    func unsplashApiBaseUrl() -> URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.unsplash.com"
        component.queryItems = [
        URLQueryItem(name: "client_id", value: ConfigurationManager.instance.plistDictionnary.clientId)
        ]
        return component
    }
    
    // Par défaut orderBy = "popular" et perPage = 10 -> Lisez la documentation de l'API pour comprendre les paramètres, vous pouvez aussi en ajouter d'autres si vous le souhaitez
    func getAllPhotos(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var url = unsplashApiBaseUrl()
        url.path = "/photos"
        return url.url
    }
    
    // Par défaut orderBy = "popular" et perPage = 10 -> Lisez la documentation de l'API pour comprendre les paramètres, vous pouvez aussi en ajouter d'autres si vous le souhaitez
    func getAllTopics(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var url = unsplashApiBaseUrl()
        url.path = "/topics"
        return url.url
    }
    
    func getTopicPictures(orderBy: String = "popular", perPage: Int = 10, id: String) -> URL? {
        var url = unsplashApiBaseUrl()
        url.path = "/topics/\(id)/photos"
        return url.url
    }
    
    func getPictureFromTopic(orderBy: String = "popular", perPage: Int = 10, id: String) -> URL? {
        var url = unsplashApiBaseUrl()
        url.path = "/photos/\(id)"
        return url.url
    }
}
