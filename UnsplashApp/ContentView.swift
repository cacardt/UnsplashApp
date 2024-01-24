//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var feedState: FeedState = FeedState();
    
    // Déclaration d'une fonction asynchrone
    func loadData() async {
        await feedState.fetchHomeFeed()
        await feedState.fetchTopics()
    }
    
    var body: some View {
        NavigationStack {
            Button(action: {
                Task {
                    await loadData()
                }
            }, label: {
                Text("Load Data")
            })
            ScrollView(.horizontal){
                LazyHGrid(rows: [GridItem(.flexible(maximum: 110))], content: {
                    if let topics = feedState.topics {
                        ForEach(topics, id: \.self) { topic in
                            NavigationLink(destination: TopicView(topic: topic).environmentObject(feedState)) {
                                VStack {
                                    AsyncImage(url: URL(string: "\(topic.cover_photo.urls.small)")) { image in
                                        image.centerCropped().cornerRadius(12)
                                    } placeholder: {
                                        ProgressView()
                                    }.frame(width:110, height: 70)
                                    Text("\(topic.title)")
                                    
                                }
                            }
                        }.navigationTitle("Topics")
                    }
                    else {
                        
                        
                        // Placeholder grid with 12 items
                        ForEach(0..<10, id: \.self) { _ in
                            VStack{
                                Rectangle()
                                    .fill(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .frame(width: 110, height: 70)
                                Text("placholder")
                            }.redacted(reason: .placeholder)
                        }
                    }
                })
            }
            .frame(height: 120)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 150)), GridItem(.flexible(minimum: 150))]) {
                    if let images = feedState.homeFeed {
                        ForEach(images, id: \.self) { image in
                            NavigationLink(destination: ImageDetail(image: image).environmentObject(feedState)) {
                                AsyncImage(url: URL(string: "\(image.urls.small)")) { image in
                                    image.centerCropped().cornerRadius(12)
                                } placeholder: {
                                    ProgressView()
                                }.frame(height: 150)
                            }
                        }
                    }
                    else {
                        // Placeholder grid with 12 items
                        ForEach(0..<12, id: \.self) { _ in
                            Rectangle()
                                .fill(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .frame(height: 150)
                        }
                    }
                    
                    
                }
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

struct User: Codable, Hashable, Equatable {
    let id, username: String
}

struct Topic: Codable, Hashable, Equatable {
    let id: String
    let title : String
    let links : Links
    let cover_photo: UnsplashPhoto
}

struct Links: Codable, Hashable, Equatable {
    let `self`: String
    let html:String
    let photos: String
}

