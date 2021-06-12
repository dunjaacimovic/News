//
//  Article.swift
//  News
//
//  Created by Dunja Acimovic on 01.06.2021..
//

import UIKit

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}

extension Article: NewsViewItemInterface {
    var imageURL: String? {
        return urlToImage
    }
}
