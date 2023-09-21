//
//  NewsContentHomepage.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import UIKit

class NewsContentHomepage: UIViewController {
    @IBOutlet weak var myTitleNews: UILabel!
    
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var myNewsContent: UILabel!
    var newsContent: ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitleNews.text = newsContent.title
        if newsContent.urlToImage != nil
        {
            let url = URL(string: newsContent.urlToImage!)
            newImage.downloadImage(from: url!)
            newImage.contentMode = .scaleToFill
        }
        else
        {
            newImage.image = UIImage(named: "empty")
        }
        myNewsContent.text = newsContent.content
}
    
}
