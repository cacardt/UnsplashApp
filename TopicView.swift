//
//  TopicView.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/24/24.
//

import SwiftUI

struct TopicView: View {
    let topic: Topic
    @EnvironmentObject var feedState: FeedState
    
    func loadData() async {
        await feedState.fetchTopicPictures(id: topic.id)
    }
    
    var body: some View {
        NavigationStack {
            Button(action: {
                Task {
                    await loadData()
                }
            }, label: {
                Text("Load Topic Data")
            })
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 150)), GridItem(.flexible(minimum: 150))]) {
                    if let images = feedState.topicPics {
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
    TopicView(topic: Topic(id: "", title: "", links: Links(self: "", html: "", photos: ""), cover_photo: UnsplashPhoto(id: "", slug: "", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: ""), user: User(id: "", username: ""))))
}
