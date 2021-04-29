//
//  NewsView.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var articles: NewsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NewsHeaderView()
            Spacer()
            NewsHeadlineView(newsViewModel: articles)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(articles: NewsViewModel())
    }
}
