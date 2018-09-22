//
//  PlayListVC.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/19/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import UIKit
import MBProgressHUD
import AVFoundation
import AVKit
import AlamofireImage

class PlayListVC: UICollectionViewController {
	
	var playlistItems = [PlaylistItem]()
	var selectedVideoId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Work @ 90 Seconds"
		self.setCollectionViewFlowLayout()
		self.setBackButton()
		self.getPlayListVideos()
    }
	
	func setCollectionViewFlowLayout() {
		
		guard let collectionView = self.collectionView else { return }
		let cellWidth: CGFloat = collectionView.frame.size.width/2.0
		let cellheight: CGFloat = cellWidth / 1.33
		let cellSize = CGSize(width: cellWidth , height:cellheight)
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.itemSize = cellSize
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.minimumLineSpacing = 0.0
		layout.minimumInteritemSpacing = 0.0
		
		collectionView.setCollectionViewLayout(layout, animated: true)
		collectionView.reloadData()
	}
	
	func setBackButton() {
		let backItem = UIBarButtonItem()
		backItem.title = "Back"
		navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
	}

	//MARK: API Methods
	func getPlayListVideos() {
		
		MBProgressHUD.showAdded(to: self.view, animated: true)
		APIClient.sharedInstance.getData(Constants.kYTPlayListURL, parameters: nil) { (response, error) in
			
			MBProgressHUD.hide(for: self.view, animated: true)
			if error != nil {
				print(error?.message ?? "")
				return
			}
			
			guard let response = response as? [String: Any] else { return }
			
			print(response)
			
			guard let items = response["items"] as? [[String: Any]] else { return }

			for item in items {
				var playlistItem = PlaylistItem()
				if let snippet = item["snippet"] as? [String: Any] {
					
					playlistItem.title = snippet["title"] as? String ?? ""
					
					if let thumbnails = snippet["thumbnails"] as? [String: Any] {
						if let images = thumbnails["high"] as? [String: Any] {
							playlistItem.thumbnailUrl = images["url"] as? String ?? ""
						}
					}
					
					if let id = snippet["resourceId"] as? [String: Any] {
						playlistItem.videoId = id["videoId"] as? String ?? ""
					}
					
					self.playlistItems.append(playlistItem)
				}
			}
			
			self.collectionView?.reloadData()
		}
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "OpenVideoPlayer" {
			let vc = segue.destination as! VideoPlayerVC
			vc.videoId = selectedVideoId
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.playlistItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCell", for: indexPath) as! PlayListCell
		
		let item = self.playlistItems[indexPath.row]
		if let url = item.thumbnailUrl, url.count > 0 {
			cell.videoThumbnail.af_setImage(withURL: URL(string:url)!)
		}
		
		cell.setNeedsLayout()
		cell.layoutIfNeeded()
        return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width:(collectionView.frame.height-90)/2, height: 100)
	}

    // MARK: UICollectionViewDelegate
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let playlistItem = self.playlistItems[indexPath.row]
		self.selectedVideoId = playlistItem.videoId
		self.performSegue(withIdentifier: "OpenVideoPlayer", sender: self)
	}
}
