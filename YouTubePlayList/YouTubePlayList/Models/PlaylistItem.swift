//
//  PlaylistItem.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/21/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import Foundation

struct PlaylistItem {
	
	var thumbnailUrl: String?
	var title: String?
	var videoId: String?
	
	init() {}
	
	init?(thumbnailUrl: String, title: String, videoId: String) {
		
		self.thumbnailUrl = thumbnailUrl
		self.title        = title
		self.videoId      = videoId
	}
	
	static func parseData(_ dictionary: [String: Any]?) -> PlaylistItem? {
		
		guard let dictionary = dictionary else { return nil }
		
		let videoId      = dictionary[APIKeys.kVideoId] as? String ?? ""
		let title        = dictionary[APIKeys.kTitle] as? String ?? ""
		let thumbnailUrl = dictionary[APIKeys.kUrl] as? String ?? ""
		
		guard let item = PlaylistItem(thumbnailUrl: thumbnailUrl, title: title, videoId: videoId) else { return nil }
		
		return item
	}
}
