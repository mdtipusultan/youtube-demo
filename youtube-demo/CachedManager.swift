//
//  CachedManager.swift
//  youtube-demo
//
//  Created by User on 2/1/22.
//  Copyright © 2022 User. All rights reserved.
//

import Foundation

class CahcheManage {
    
    static var cache = [String:Data]()
    
    static func setVideoCache (_ url:String, _ data: Data?) {
    
        // store the image data and use the url as key
        cache[url] = data
        
    }
    
    static func getVideoCache (_ url:String) -> Data? {
        
        // try to get the data for the specified url
        return cache[url]
    }
    
}
