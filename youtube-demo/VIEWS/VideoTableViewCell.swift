//
//  VideoTableViewCell.swift
//  youtube-demo
//
//  Created by User on 2/1/22.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var TemplateImageView: UIImageView!
    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var DateLable: UILabel!
    
    var video: Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        func setCell (_ v:Video) {
            
            self.video = v
            
            //ensuring that we have a video
            guard self.video != nil  else {
                return
            }
            
            //set the title
            self.TitleLable.text = video?.title
            
            //set the date
            let df = DateFormatter()
            df.dateFormat = "EEEE, MMM d, yyyy"
            self.DateLable.text = df.string(from: video!.published)
            
            
            // set the thumbnail
            guard self.video!.thumbnail != "" else {
                return
            }
            
            //check cache before downloading data
            if let cacheData = CahcheManage.getVideoCache(self.video!.thumbnail){
                
                //set the thumbnail imageview
                self.TemplateImageView.image = UIImage(data: cacheData)
                return
            }
            
            // download the thumbnail data
            let url = URL(string: self.video!.thumbnail)
            
            // get the Shared URL Session object
            let session = URLSession.shared
            
            // create a data task
            let datatask = session.dataTask(with: url!) { (data, response, error) in
                
                if error == nil && data != nil
                    
                {
                    
                    CahcheManage.setVideoCache(url!.absoluteString , data)
                    
                    // check the downloaded image url is equal to the video thumbnail url that this cell currenty set to display
                    if url?.absoluteString != self.video?.thumbnail
                    {
                        // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                        return
                    }
                    // create the image object
                    let image = UIImage(data: data!)
                    
                    // set the imageview
                    DispatchQueue.main.async {
                        self.TemplateImageView.image = image
                        
                    }
                }
            }
            
            // kick off the datatask
            datatask.resume()
    }

}
