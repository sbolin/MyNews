//
//  ArticleView.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import SwiftUI

struct NewsHeadlineView: View {
    
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        List(newsViewModel.newsArticles) { article in
            NewsCell(article: article)
        }
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeadlineView(newsViewModel: NewsViewModel())
    }
}
