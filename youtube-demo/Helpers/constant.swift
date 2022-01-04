//
//  constant.swift
//  youtube-demo
//
//  Created by User on 30/12/21.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation

struct Constant {
    
    static var API_KEY = "AIzaSyCW5njaAxrTY4Q8D82TcQ_Woi2T3_TvC-E"
    static var PLAYLIST_ID = "PLMRqhzcHGw1YqPh-ggQHJPAUxdHov_uNJ"
    //"PLRRmxaFCrLnWmKoxyUnS_fCDCTE6Ewd12"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constant.PLAYLIST_ID)&key=\(Constant.API_KEY)"
    
    static var VIDEOCELL_ID = "Video_Cell"
    
    static var YT_Embed_URL = "https://www.youtube.com/embed/"
}
