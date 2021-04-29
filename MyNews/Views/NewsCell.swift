//
//  NewsCell.swift
//  MyNews
//
//  Created by Scott Bolin on 29-Apr-21.
//

import SwiftUI

struct NewsCell: View {
    
    //    var article: Article
    var article: Article
    @State private var isShowingSafariView = false
    @State private var selectedArticle: Article?
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                NewsRemoteImage(urlString: article.imageURL)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(article.title)
                        .font(.system(size: 15, weight: .medium))
                    
                    Text(article.articlePublishDate + " by "+article.source.name)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    Text(article.articleDescription ?? "No Description")
                        .font(.system(size: 13, weight: .light))
                }
            } // HStack
            .contentShape(Rectangle())
            .onTapGesture {
                selectedArticle = article
                isShowingSafariView.toggle()
            } // onTapGesture
            .fullScreenCover(isPresented: $isShowingSafariView, content: {
                SafariView(url: URL(string: article.url)!)
            }) // fullScreenCover
        } // VStack
    } // body
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(article: Article.mockArticle)
    }
}
