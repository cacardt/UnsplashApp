//
//  ImageDetail.swift
//  UnsplashApp
//
//  Created by Theo CACARD on 1/24/24.
//

import SwiftUI

struct ImageDetail: View {
    let image : UnsplashPhoto
    @EnvironmentObject var feedState: FeedState
    
    var body: some View {
        Text("Une image de \(image.user.username)")
        AsyncImage(url: URL(string: "\(image.urls.small)")) { image in
            image.centerCropped().cornerRadius(12)
        } placeholder: {
            ProgressView()
        }.frame(height: 150)
    }
}

#Preview {
    ImageDetail(image: UnsplashPhoto(id: "", slug: "", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: ""), user: User(id: "", username: "")))
}
