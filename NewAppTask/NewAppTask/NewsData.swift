//
//  NewsData.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import Foundation
struct NewsData: Codable{
    let status: String
    let articles: [ArticleData]
}
