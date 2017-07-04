//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Gabriel Muñiz on 7/3/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var composeMessage: UITextField!
    @IBAction func didCancel(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        composeMessage.becomeFirstResponder()
        tweetButton.layer.cornerRadius = 0.15*tweetButton.frame.width
        tweetButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
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
