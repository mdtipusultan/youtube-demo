//
//  ViewController.swift
//  youtube-demo
//
//  Created by User on 29/12/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    
    @IBOutlet weak var Tableview: UITableView!
    var Videos = [Video]()

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        
        Tableview.delegate = self
        Tableview.dataSource = self
        
        model.delegate = self
    }
    
    // this function is for to auto call of segue to show the video in DetailViewConrol
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check a video is tap
        guard Tableview.indexPathForSelectedRow != nil else {
            return
        }
        
        // get the reference of the video
        let selectedVideo = Videos[Tableview.indexPathForSelectedRow!.row]
        
        // get the reference of the detail view controller
        let detail_VC = segue.destination as! DetalsViewController
            
        // set the video property to detail view control
        detail_VC.video = selectedVideo
    }
    
    
    // MARK:- MODEL DELEGATE METHOD
    
    func Video_Fetched(_ videos: [Video]) {
        
        // set the returned video to our video property
        self.Videos = videos
        
        // Refreshed the tableview
        Tableview.reloadData()
    }
    
    
    //MARK:- Delegate & Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with data
        let video = self.Videos[indexPath.row]
        
        cell.setCell(video)
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

