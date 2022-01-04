//
//  Response.swift
//  youtube-demo
//
//  Created by User on 30/12/21.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation


struct Response: Decodable {
    
    var items: [Video]?
    
    enum codingKeys:String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: codingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }

}
