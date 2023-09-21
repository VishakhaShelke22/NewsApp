//
//  ArticleData.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import Foundation
struct ArticleData: Codable
{
    let author: String?
    let title: String
    let urlToImage: String?
    let content: String?
}
