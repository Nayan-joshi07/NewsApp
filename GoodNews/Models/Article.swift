//
//  Article.swift
//  GoodNews
//
//  Created by Nayan joshi on 15/01/21.
//  Copyright © 2021 Nayan joshi. All rights reserved.
//

import Foundation
struct ArticleList:Decodable
{
    let articles :[Article]
}
struct Article : Decodable
{
    let title : String
    let description : String
}
