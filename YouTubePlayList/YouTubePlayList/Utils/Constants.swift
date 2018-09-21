//
//  Constants.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/19/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import Foundation

struct Constants {
	
	public static let kAPIKey     = "AIzaSyC9r7YRNBk2spsbzh98g6c21BvVjhbqKC4"
	public static let kPlayListId = "PLyRfJw1I1N7HOCVMCJ3xpvKmAfZBv684-"
	
	//API End points
	private static let kBaseUrl      = "https://www.googleapis.com/youtube/v3"
	public static let kYTPlayListURL = kBaseUrl + "/playlistItems?part=snippet&playlistId=\(kPlayListId)&key=\(kAPIKey)"
}

struct APIKeys {
	
	public static let kTitle   = "title"
	public static let kVideoId = "videoId"
	public static let kUrl     = "url"
	
	public static let kErrorCode     = "error_code"
	public static let kErrorMessage  = "error_message"
}
