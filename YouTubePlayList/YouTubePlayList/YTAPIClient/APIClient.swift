//
//  APIClient.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/19/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import Alamofire

typealias CompletionHandler = (_ response: Any?, _ error: ErrorResponse?) -> Void

class APIClient: Any {

	static let sharedInstance = APIClient()
	
	func getData(_ path: String, parameters: [String: Any]?, completion: @escaping CompletionHandler) {

		guard let url = URL(string: Constant.kYTPlayListURL) else { return }
		Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.init(options: []), headers: nil)
			.responseJSON { (response) in
				
				print(response)
		}
	}
}
