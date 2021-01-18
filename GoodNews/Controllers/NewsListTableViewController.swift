//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Nayan joshi on 15/01/21.
//  Copyright © 2021 Nayan joshi. All rights reserved.
//

import Foundation
import UIKit
class NewsListTableViewController : UITableViewController
{
    private var articleListVM:ArticleListViewModel!
   override func viewDidLoad()
   {
     super.viewDidLoad();
     setup();
   }
    private func setup()
    {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&apiKey=9d68ea81278247f394c2bd78f192e6f1")!
        Webservice().getArticles(url: url)
        {
            articles in
            if let articles = articles
            {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async
                    {
                        self.tableView.reloadData()
                }
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0:self.articleListVM.numberOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSections(section)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell",for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCell not found  ")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}
