//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import OAuthSwift
import OAuthSwiftAlamofire

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var indexPath: Int!
    
    var tweet: Tweet! {
        didSet {
            avatarImage.layer.cornerRadius = 0.5*avatarImage.frame.width
            avatarImage.layer.masksToBounds = true
            tweetTextLabel.text = tweet.text
            username.text = tweet.user.name
            screenName.text = tweet.user.screenName
            let imageURL = tweet.user.avatar!
            self.avatarImage.af_setImage(withURL: imageURL)
            
            self.timestampLabel.text = tweet.createdAtString
            
            if tweet.favorited == true {
                likeButton.isSelected = true
            } else if tweet.favorited == false {
                likeButton.isSelected = false
            }
            
            if tweet.retweeted == true {
                retweetButton.isSelected = true
            } else if tweet.retweeted == false {
                retweetButton.isSelected = false
            }
            
            if tweet.retweetCount == 0 {
                retweetCount.text = ""
            } else if tweet.retweetCount != 0 {
                retweetCount.text = String(tweet.retweetCount)
            }
            
            if tweet.favoriteCount == 0 {
                likeCount.text = ""
            } else if tweet.favoriteCount != 0 {
                likeCount.text = String(tweet.favoriteCount)
            }
            // Calling the favorite(completion:) method
            
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
