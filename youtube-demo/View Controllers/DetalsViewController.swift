//
//  DetalsViewController.swift
//  youtube-demo
//
//  Created by User on 2/1/22.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit
import WebKit


class DetalsViewController: UIViewController {

    
    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var DateLable: UILabel!
    @IBOutlet weak var WebViewLable: WKWebView!
    @IBOutlet weak var TextViewLable: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //clear the fields
        TitleLable.text = ""
        DateLable.text = ""
        TextViewLable.text = ""
        
        //check there is a video
        guard video != nil else {return}
        
        // create the embed URL
        let embed_URLString = Constant.YT_Embed_URL + video!.videoId
        
        // load it into the webview
        let url = URL(string: embed_URLString)
        let request = URLRequest(url: url!)
        WebViewLable.load(request)
        
        
        //set title
        TitleLable.text = video!.title
        
        //set date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        DateLable.text = df.string(from: video!.published)
        
        //set description
        TextViewLable.text = video?.description
        
    }
}
