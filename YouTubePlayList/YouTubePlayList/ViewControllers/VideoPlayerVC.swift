//
//  VideoPlayerVC.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/22/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import UIKit

class VideoPlayerVC: UIViewController {
	
	var videoId: String?
	
	@IBOutlet weak var webView: UIWebView8!
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "90 Seconds"
		self.loadURLData()
    }
	
	func loadURLData() {
		guard let videoId = self.videoId else { return }
		guard let url = URL(string: Constants.kVideoUrl+videoId) else  { return }
		let responseObj = URLRequest(url: url)
		self.webView.loadRequest(responseObj)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
	}
}

extension VideoPlayerVC: UIWebViewDelegate {
	
	func webViewDidFinishLoad(_ webView: UIWebView) {
		self.spinner.stopAnimating()
		self.spinner.isHidden = true
	}
}

