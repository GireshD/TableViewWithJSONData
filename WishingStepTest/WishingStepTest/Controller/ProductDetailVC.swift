//
//  ProductDetailVC.swift
//  WishingStepTest
//
//  Created by Giresh Dora on 13/01/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit
import WebKit

class ProductDetailVC: UIViewController {

    // MARK:- properties and outlets
    
    var webView: WKWebView!
    var urlString = String()
    
    // MArk:- Viewcontroller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadWebviewURl()
    }
    
    // MARK:- Custom methods
    
    func loadWebviewURl(){
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}

// MARK:- Extension

extension ProductDetailVC : WKNavigationDelegate {
    
    //MARK:- WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)  {
        print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
        
    }
}
