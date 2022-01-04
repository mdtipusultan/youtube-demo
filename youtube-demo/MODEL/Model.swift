//
//  Model.swift
//  youtube-demo
//
//  Created by User on 30/12/21.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func Video_Fetched (_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constant.API_URL)
        
        guard url != nil
            else {return}
        
        // Get a URL Session object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object --> single call to the API
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
            // check for error
            if  error != nil || data == nil {
                return
            }
            
            do{
                // parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
            
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil {
                
                    DispatchQueue.main.async {
                        // cell the 'videofetched' method of the delegate
                        self.delegate?.Video_Fetched(response.items!)
                        
                    }
                    
                }
                //dump(response)
                
            }
            catch {
                
                
            }
            
        }
        
        // kick off the task
        datatask.resume()
        
    }
}
