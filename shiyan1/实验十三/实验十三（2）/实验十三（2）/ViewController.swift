//
//  ViewController.swift
//  实验十三（2）
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 周帆. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    
    @IBOutlet weak var urlTextFiled: UITextField!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://www.baidu.com"){
            webView.load(URLRequest(url: url))
            
        }
    }
    
    @IBAction func webBack(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func webForward(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func webReload(_ sender: Any) {
        webView.reload()
    }
    @IBAction func webClose(_ sender: Any) {
        webView.willMove(toSuperview: view)
        
    }
    @IBAction func webSearch(_ sender: Any) {
        if let url = URL(string: urlTextFiled.text ?? ""){
            webView.load(URLRequest(url: url))
        }
    }
}

