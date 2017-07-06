//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Gabriel Muñiz on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //Outlets setup
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    
    //Variable setup
    var tweet: Tweet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = 0.5*avatarImage.frame.width
        avatarImage.layer.masksToBounds = true
        
        username.text = tweet.user.name
        screenName.text = tweet.user.screenName
        timestamp.text = tweet.createdAtString
        tweetText.text = tweet.text
        
        if tweet.retweetCount == 0 {
            retweetCount.text = ""
        } else if tweet.retweetCount != 0 {
            retweetCount.text = String(describing: tweet.retweetCount)
        }
        
        if tweet.favoriteCount == 0 {
            favoriteCount.text = ""
        } else if tweet.favoriteCount != 0 {
            favoriteCount.text = String(describing: tweet.favoriteCount)
        }
        
        let avatarURL = tweet.user.avatar
        avatarImage.af_setImage(withURL: avatarURL!)
        
        let backdropURL = tweet.user.backdrop
        backdropImage.af_setImage(withURL: backdropURL!)
        
        
        if tweet.favorited == true {
            likeButton.isSelected = true
            favoriteCount.textColor = UIColor.red
        } else if tweet.favorited == false {
            likeButton.isSelected = false
            favoriteCount.textColor = UIColor.black
        }
        
        if tweet.retweeted == true {
            retweetButton.isSelected = true
            retweetCount.textColor = UIColor.green
        } else if tweet.retweeted == false {
            retweetButton.isSelected = false
            retweetCount.textColor = UIColor.black
        }
        
        
    }

    
    @IBAction func didLike(_ sender: Any) {
        if tweet.favorited == false {
            likeButton.isSelected = true
            tweet.favorited = true
            tweet.favoriteCount += 1
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            
        } else if tweet.favorited == true {
            likeButton.isSelected = false
            tweet.favorited = false
            tweet.favoriteCount -= 1
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    
    
    @IBAction func didRetweet(_ sender: Any) {
        if retweetButton.isSelected == false {
            retweetButton.isSelected = true
            tweet.retweeted = true
            tweet.retweetCount += 1
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                print("HERE")
                if let error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        } else if retweetButton.isSelected == true {
            retweetButton.isSelected = false
            tweet.retweeted = false
            tweet.retweetCount -= 1
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
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
