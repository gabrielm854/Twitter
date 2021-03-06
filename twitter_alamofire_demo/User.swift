//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import OAuthSwiftAlamofire
import OAuthSwift

class User {
    
    var name: String
    var screenName: String
    var dictionary: [String: Any]?
    var tagline: String?
    var avatar: URL?
    var backdrop: URL?
    var followers: Int
    var following: Int
    var tweetCount: Int
    
   static var _current: User?
    
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        name = dictionary["name"] as! String
        screenName = dictionary["screen_name"] as! String
        tagline = dictionary["description"] as! String
        followers = dictionary["followers_count"] as! Int
        following = dictionary["friends_count"] as! Int
        tweetCount = dictionary["statuses_count"] as! Int
        let urlString = dictionary["profile_image_url_https"] as? String
        if let urlString = urlString {
            avatar = URL(string: urlString)
        }
        let backdropUrlString = dictionary["profile_banner_url"] as? String
        if let backdropUrlString = backdropUrlString {
            backdrop = URL(string: backdropUrlString)
        }
    }
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }

}
