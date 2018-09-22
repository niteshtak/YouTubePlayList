//
//  VideoPlayerVC.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/22/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayerVC: UIViewController {
	
	var videoId: String?
	
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	@IBOutlet weak var playerView: YTPlayerView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "90 Seconds"
		var playerVars = [String: Any]()
		playerVars["playsinline"] = 1
		self.playerView.delegate = self
		if let videoId = self.videoId {
			self.playerView.load(withVideoId: videoId, playerVars: playerVars)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
	}
}

extension VideoPlayerVC: YTPlayerViewDelegate {
	func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
		self.spinner.stopAnimating()
		self.spinner.isHidden = true
	}
}

