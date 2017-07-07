//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Gabriel Muñiz on 7/3/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import OAuthSwift
import OAuthSwiftAlamofire


//protocol ComposeViewControllerDelegate {
//    func did(post: Tweet)
//}

class ComposeViewController: UIViewController, UITextViewDelegate { //, ComposeViewControllerDelegate {
    
    //weak var delegate: ComposeViewControllerDelegate?
    
    var currentUser = User.current
    
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var composeText: UITextView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var characterCounting: UILabel!
    @IBAction func didCancel(_ sender: Any) {
        self.view.endEditing(true)
        self.dismiss(animated: true)
        
        
        //Trying to get an alert message asking if it should delete the tweet or not
        
        //        if composeText.text.characters.count != 0 {
        //            self.view.endEditing(true)
        //            let alertController = UIAlertController(title: nil, message: "You are about to leave this window and delete your message.", preferredStyle: .actionSheet)
        //            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(action) in
        //            }
        //            alertController.addAction(cancelAction)
        //
        //            let deleteTweet = UIAlertAction(title: "I know, delete Tweet", style: .default) {(action) in
        //                self.dismiss(animated: true) {
        //                }
        //            }
        //        } else {
        //            self.view.endEditing(true)
        //            self.dismiss(animated: true)
        //        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        composeText.becomeFirstResponder()
        tweetButton.layer.cornerRadius = 0.15*tweetButton.frame.width
        tweetButton.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = 0.5*avatarImage.frame.width
        avatarImage.layer.masksToBounds = true
        let imageURL = currentUser?.avatar!
        self.avatarImage.af_setImage(withURL: imageURL!)
        composeText.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        let text = composeText.text ?? ""
        if text.characters.count > 140 {
            let alertController = UIAlertController(title: "Thesis Alert", message: "You exceeded the character count... 'bájale mil'. ", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else if text.characters.count == 0 {
            let alertController = UIAlertController(title: "Empty message", message: "You need to write something to post.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else{
            APIManager.shared.composeTweet(with: text) { (tweet: Tweet?, error: Error?) in
                print("HERE")
                if let error = error {
                    print("Error posting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully tweeted the following Tweet: \n\(tweet.text)")
                }
            }
            self.dismiss(animated: true, completion: nil)
            view.endEditing(true)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let countingCharacters = 140-composeText.text.characters.count
        characterCounting.text = String(describing: countingCharacters)
        if countingCharacters >= 20 {
            characterCounting.textColor = UIColor.gray
        } else if countingCharacters < 20 {
            characterCounting.textColor = UIColor.red
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
