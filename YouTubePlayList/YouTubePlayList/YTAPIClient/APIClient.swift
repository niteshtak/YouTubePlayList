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

		guard let url = URL(string: Constants.kYTPlayListURL) else { return }
		Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.init(options: []), headers: nil)
			.responseJSON { (response) in
				
				guard let httpResponse = response.response else {
					let error = ErrorResponse(message: "Something went wrong, please try later!", code: "500")
					completion(nil, error)
					return
				}
				
				let statusCode = Int(httpResponse.statusCode)
				let json = response.result.value as? [String: Any]
				switch statusCode {
				case (200...300):
					guard let value = json else {
							print("No data available!")
							let error = ErrorResponse(message: "No data available!", code: "200")
							completion(nil, error)
							return }
					completion(value, nil)
					break
				default:
					print("Something went wrong 😔")
					let error = ErrorResponse(message: "Something went wrong, please try later!", code: "500")
					completion(nil, error)
				}
		}
	}
}
