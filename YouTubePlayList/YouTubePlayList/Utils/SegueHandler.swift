//
//  SegueHandler.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/22/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import UIKit
import Foundation

protocol SegueHandlerType {
	associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
	
	func performSegueWithIdentifier(segueIdentifier: SegueIdentifier,
									sender: AnyObject?) {
		
		performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
	}
	
	func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
		
		guard let identifier = segue.identifier,
			let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
				fatalError("Invalid segue identifier \(String(describing: segue.identifier)).") }
		
		return segueIdentifier
	}
}
