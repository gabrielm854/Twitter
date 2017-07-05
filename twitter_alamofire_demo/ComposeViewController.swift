//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Gabriel Muñiz on 7/3/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire


//protocol ComposeViewControllerDelegate {
//    func did(post: Tweet)
//}

class ComposeViewController: UIViewController, UITextViewDelegate { //, ComposeViewControllerDelegate {
    
    //weak var delegate: ComposeViewControllerDelegate?
    
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var composeText: UITextView!
    @IBAction func didCancel(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeText.becomeFirstResponder()
        tweetButton.layer.cornerRadius = 0.15*tweetButton.frame.width
        tweetButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        //        APIManager.shared.composeTweet(with: composeText.text) { (tweet, error) in
        //            if let error = error {
        //                print("Error composing Tweet: \(error.localizedDescription)")
        //            } else if let tweet = tweet {
        //                self.delegate?.did(post: tweet)
        //                print("Compose Tweet Success!")
        //            }
        //        }
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
