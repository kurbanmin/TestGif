//
//  GifDetailViewController.swift
//  TestGif
//
//  Created by pro on 07.07.2020.
//  Copyright © 2020 pro. All rights reserved.
//

import UIKit
import SwiftyGif

class GifDetailViewController: UIViewController {
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var gifImageViewAspectRatioContraint: NSLayoutConstraint!
    
    var imageData: Original?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: imageData!.url) else { return }
               gifImageView.setGifFromURL(url)
        
        if let width = Double(imageData!.width),
            let height = Double(imageData!.height) {
            gifImageViewAspectRatioContraint.constant =  CGFloat(height / width)
        }
    }
    
    func configure(imageData: Original) {
        self.imageData = imageData
    }
}
