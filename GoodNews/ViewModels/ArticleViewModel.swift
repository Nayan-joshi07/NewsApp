//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Nayan joshi on 15/01/21.
//  Copyright © 2021 Nayan joshi. All rights reserved.
//

import Foundation
struct ArticleListViewModel
{
    let articles:[Article]
}
extension ArticleListViewModel{
    var numberOfSections:Int
    {
        return 1
    }
    func numberOfRowsInSections(_ sections: Int) -> Int
    {
        return self.articles.count
    }
    func articleAtIndex(_ index: Int) -> ArticleViewModel
    {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}
struct ArticleViewModel
{
    private let article:Article
}
extension ArticleViewModel
{
    init(_ article: Article)
    {
        self.article = article
    }
}
extension ArticleViewModel
{
    var title:String
    {
        return self.article.title
    }
    var description:String
    {
        return self.article.description
    }
}
