//
//  GifSearchCell.swift
//  TestGif
//
//  Created by pro on 05.07.2020.
//  Copyright © 2020 pro. All rights reserved.
//

import UIKit
import SwiftyGif

class GifSearchCell: UITableViewCell {

    @IBOutlet weak var gifImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        gifImageView.clear()
    }

    func configure(gifData: GifData) {
        let original = gifData.images.original
        guard let url = URL(string: original.url) else { return }
        gifImageView.setGifFromURL(url)
        

    }

}
