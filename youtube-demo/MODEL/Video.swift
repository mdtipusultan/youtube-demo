//
//  Video.swift
//  youtube-demo
//
//  Created by User on 30/12/21.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()

    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init (from decoder : Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse publishedAt
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        // parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highcontainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        //parse thumbnail
        self.thumbnail = try highcontainer.decode(String.self, forKey: .thumbnail)
        
        // parse video Id
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        //print(videoId)
        
        
    }
}





