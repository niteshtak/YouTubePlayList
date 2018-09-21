//
//  PlaylistItem.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/21/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import Foundation

struct PlyslistItem {
	
	var thumbnailUrl: String! = nil
	var title: String! = nil
	var videoId: String! = nil
	
	init() {}
	
	init?(thumbnailUrl: String, title: String, videoId: String) {
		
		self.thumbnailUrl = thumbnailUrl
		self.title        = title
		self.videoId      = videoId
	}
	
	static func parseData(_ dictionary: [String: Any]?) -> PlaylistItem? {
		
		guard let dictionary = dictionary else { return nil }
		
		let videoId      = dictionary[""] as? String ?? ""
		let title        = dictionary[""] as? String ?? ""
		let thumbnailUrl = dictionary[""] as? String ?? ""
		
		guard let item = PlaylistItem(thumbnailUrl: thumbnailUrl, title: title, videoId: videoId) else { return nil }
		
		return item
	}
}
