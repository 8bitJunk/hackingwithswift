//
//  ViewController.swift
//  project4
//
//  Created by Ryan Gibbs on 16/07/2015.
//  Copyright © 2015 Ryan Gibbs. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = NSURL(string: "https://www.github.com/8bitJunk")!
//        webView.loadRequest(NSURLRequest(URL: url))
//        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: "openTapped")
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "Open Page...", message: nil, preferredStyle: .ActionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .Default, handler: openPage))
        ac.addAction(UIAlertAction(title: "github.com", style: .Default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func openPage(sender: UIAlertAction) {
        let url = NSURL(string: "http://www." + sender.title!)
        webView.loadRequest(NSURLRequest(URL: url!))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}