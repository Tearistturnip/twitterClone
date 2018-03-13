//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Justin Lee on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage
import RSKPlaceholderTextView


protocol ComposeViewControllerDelegate{
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {
    
    
    var delegate: ComposeViewControllerDelegate?

    @IBOutlet weak var userPicImage: UIImageView!
    
    @IBOutlet weak var tweetText: RSKPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPicImage.af

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetText.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
        
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
