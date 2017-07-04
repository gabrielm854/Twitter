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

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var retweetCount: UIButton!
    @IBOutlet weak var likeCount: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            username.text = tweet.user.name
            screenName.text = tweet.user.screenName
            retweetCount.titleLabel?.text = String(tweet.retweetCount)
            likeCount.titleLabel?.text = String(tweet.favoriteCount!)
        }
    }
    
    
    @IBAction func didLike(_ sender: Any) {
    
    }
    
    
    @IBAction func didRetweet(_ sender: Any) {
    
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
