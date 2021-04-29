//
//  NewsHeaderView.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import SwiftUI

struct NewsHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("MyNews")
                .font(.title)
                .foregroundColor(.green)
            
            HStack(spacing: 4) {
                Text("From")
                Image(systemName: "applelogo")
                Text("NewsAPI")
            }
            .font(.title2)
            .foregroundColor(.gray)

            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
        }
        .padding(.horizontal, 4)
    }
}

struct NewsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeaderView()
    }
}
