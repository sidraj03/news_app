//
//  Article.swift
//  newsy
//
//  Created by Sidharth  Miglani on 5/2/19.
//  Copyright © 2019 Sidharth  Miglani. All rights reserved.
//
import Foundation
import UIKit
class Article{
    var content:String=""
    var imgurl:String=""
    var url:String=""
    init(imgurl:String,content:String,url:String){
        self.content=content
        self.imgurl=imgurl
        self.url=url
    }
}
