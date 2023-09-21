//
//  ViewController.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import UIKit


class ViewController: UIViewController {
    
    var articleList = [ArticleData]()
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Headlines"
        view.backgroundColor = .black
        fetchData()
        
    }
   func fetchData()
   {
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-09-20&to=2023-09-20&sortBy=popularity&apiKey=70790a403d9145129388a2466ffe7e77")
    let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
        (data,response,error) in
        guard let data = data,error == nil else
        {
            print("Error Occured while Accessing Data with URL")
            return
        }
        var newsFullList: NewsData?
        do
        {
            newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
            
        }
        catch
        {
          print("Error Occured while Decoding JSON into swift Structure \(error)")
        }
        self.articleList = newsFullList!.articles
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    })
    dataTask.resume()
   }

}
extension UIImageView
{
    func downloadImage(from url: URL)
    {
        contentMode = .scaleAspectFill
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else
            {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
            
        })
        dataTask.resume()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if articleList[indexPath.row].author != nil
        {
            cell.mylabel2.text = "Author: \(articleList[indexPath.row].author!)"
        }
        else
        {
            cell.mylabel2.text = articleList[indexPath.row].title
        }
        cell.myLabel1.text = articleList[indexPath.row].title
        if articleList[indexPath.row].urlToImage != nil
        {
            let url = URL(string: articleList[indexPath.row].urlToImage!)
            cell.myImageView.downloadImage(from: url!)
            cell.myImageView.contentMode = .scaleAspectFill
        }
        else
        {
            cell.myImageView.image = UIImage(named: "empty")
        }
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "NewsContentHome") as? NewsContentHomepage
        vc?.newsContent = articleList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}
