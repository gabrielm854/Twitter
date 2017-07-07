//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Gabriel Muñiz on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import OAuthSwift
import OAuthSwiftAlamofire

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweet: Tweet!
    var currentUser = User.current
    var tweets: [Tweet] = []
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var tweetsCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = 0.5*avatarImage.frame.width
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        username.text = currentUser?.name
        screenName.text = currentUser?.screenName
        tagline.text = currentUser?.tagline
        followersCount.text = String(describing: currentUser!.followers)
        followingCount.text = String(describing: currentUser!.following)
        tweetsCount.text = String(describing: currentUser!.tweetCount)
        let imageURL = currentUser?.avatar!
        self.avatarImage.af_setImage(withURL: imageURL!)
        let backdropImageURL = currentUser?.backdrop!
        self.backdropImage.af_setImage(withURL: backdropImageURL!)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        APIManager.shared.getUserTimeLine { (tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            } else if let error = error {
                print("Error getting user timeline: " + error.localizedDescription)
            }
        }
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
