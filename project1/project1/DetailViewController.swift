//
//  DetailViewController.swift
//  project1
//
//  Created by Ryan Gibbs on 16/07/2015.
//  Copyright © 2015 Ryan Gibbs. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let imageView = detailImageView {
                imageView.image = UIImage(named: detail)
                self.title = detail
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }
    
    func shareTapped() {
        // use for things like airdrop and airprint etc
//        let activity = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
//        presentViewController(activity, animated: true, completion: nil)
        
        // use for specific social service like facebook or twitter, set fields on service like urls and images
        let social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        social.setInitialText("Hello World!")
        social.addImage(detailImageView.image!)
        social.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(social, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

