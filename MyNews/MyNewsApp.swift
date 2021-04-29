//
//  MyNewsApp.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import SwiftUI

@main
struct MyNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NewsView(articles: NewsViewModel())
        }
    }
}
