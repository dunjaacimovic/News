//
//  NewsTableViewItem.swift
//  News
//
//  Created by Dunja Acimovic on 13.06.2021..
//

import Foundation

class NewsTableViewCellItem {
    let title: String
    let description: String
    let imageURL: String
    let url: String
    var imageData: Data? = nil
    let source: Source
    
    init(title: String, description: String, imageURL: String, url: String, source: Source) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.url = url
        self.source = source
    }
}

