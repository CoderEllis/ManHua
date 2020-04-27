//
//  LBUWebController.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import WebKit

class LBUWebController: LBUBaseController {
    var request : URLRequest!
    
    lazy var webView : WKWebView = {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.uiDelegate = self
        return webView
    }()
    
    lazy var progressView : UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackImage = UIImage(named: "nav_bg")
        progressView.progressTintColor = UIColor.white
        return progressView
    }()
    
    convenience init(url: String?) {
        self.init()
        self.request = URLRequest(url: URL(string: url ?? "")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.load(request)
    }
    

    override func setupLayout() {
        view.addSubview(webView)
        webView.snp.makeConstraints{ $0.edges.equalTo(view.usnp.edges) }
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_reload"), target: self, action: #selector(reload))
    }
    
    @objc func reload() {
        webView.reload()
    }
    
    override func pressBack() {
        if webView.canGoBack {
            webView.goBack()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        pringLog(self.classForCoder)
    }

}

extension LBUWebController : WKNavigationDelegate, WKUIDelegate {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.isHidden = webView.estimatedProgress >= 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
        navigationItem.title = title ?? (webView.title ?? webView.url?.host)
    }
    
}
