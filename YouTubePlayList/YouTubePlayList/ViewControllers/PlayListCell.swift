//
//  PlayListCell.swift
//  YouTubePlayList
//
//  Created by Nitesh Tak on 9/19/18.
//  Copyright © 2018 nitesh. All rights reserved.
//

import UIKit

class PlayListCell: UICollectionViewCell {
	
	@IBOutlet weak var videoThumbnail: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.contentView.frame = self.bounds
		self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}
	
	//Lays out subviews.
	override open func layoutSubviews() {
		super.layoutSubviews()
		videoThumbnail.frame = self.bounds
	}
}
