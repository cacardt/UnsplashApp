//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    
    let imageURLs: [String] = [
        "https://images.unsplash.com/photo-1683009427666-340595e57e43?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MXwxfGFsbHwxfHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1563473213013-de2a0133c100?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHwyfHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1490349368154-73de9c9bc37c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHwzfHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1495379572396-5f27a279ee91?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw0fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1560850038-f95de6e715b3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw1fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1695653422715-991ec3a0db7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MXwxfGFsbHw2fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1547327132-5d20850c62b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw3fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1492724724894-7464c27d0ceb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw4fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1475694867812-f82b8696d610?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw5fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1558816280-dee9521ff364?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHwxMHx8fHx8fDF8fDE3MDM3NTk1NTF8&ixlib=rb-4.0.3&q=80&w=1080"
    ]
//    let images: [String] = [
//        "https://images.unsplash.com/photo-1705773895630-0b15890ded6e?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTUxNTh8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1704949834515-e9d11a0ceb9a?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTUzMjB8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1703179026281-285ea9c56edd?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTU0NTl8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1703533140744-bb66f9390245?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTYyOTB8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1704972841788-86fac20fc87e?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTYzMTB8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1702913182391-cb0783cbfaf8?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTYzMzZ8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1705256978713-d51de443130d?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTcxODJ8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1705622445363-7636870b9e7e?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTcxOTV8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1704733689120-47becae638be?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTcyMDh8&ixlib=rb-4.0.3&q=85",
//        "https://images.unsplash.com/photo-1705179573286-495f1b4fabaf?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTcyMjR8&ixlib=rb-4.0.3&q=85",
//    ]
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible(minimum: 150)), GridItem(.flexible(minimum: 150))], content: {
                    
                        ForEach(imageURLs, id: \.self) {image in
                            AsyncImage(url: URL(string: "\(image)")) { image in
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

struct UnsplashPhoto: Codable {
    let id, slug: String
    let urls: Urls
    let user: User
}

struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

struct User: Codable {
    let id, username: String
}
