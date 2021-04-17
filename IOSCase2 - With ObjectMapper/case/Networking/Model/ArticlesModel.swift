//
//  ArticlesModel.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import ObjectMapper

class ArticlesModel: Mappable {
    var source: SourceModel?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
}

class SourceModel: Mappable {
    var id: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
    
}

//    "source": {
//
//        "id": "cnn",
//        "name": "CNN"
//
//    },
//    "author": "Helen Regan and Sophie Jeong, CNN",
//    "title": "11 of 22 Chinese miners trapped in gold mine rescued - CNN",
//    "description": "Eleven miners who were trapped in a gold mine for more than two weeks in eastern China have been rescued, Chinese state media reported.",
//    "url": "https://www.cnn.com/2021/01/24/china/china-trapped-miners-intl-hnk/index.html",
//    "urlToImage": "https://cdn.cnn.com/cnnnext/dam/assets/210121231120-01-china-mine-explosion-0120-super-tease.jpg",
//    "publishedAt": "2021-01-24T08:07:00Z",
//    "content": "(CNN)Eleven miners who were trapped in a gold mine for more than two weeks in eastern China have been rescued, Chinese state media reported.\r\nAuthorities have been racing to dig out 22 people trapped… [+2824 chars]"
