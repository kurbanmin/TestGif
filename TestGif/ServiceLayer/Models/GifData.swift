//
//  GifData.swift
//  
//
//  Created by pro on 05.07.2020.
//

import Foundation

struct GifResponse: Codable {
    let data: [GifData]
}

struct GifData: Codable {
    let images: Images
}

struct Images: Codable {
    let original: Original
}

struct Original: Codable {
    let url: String
    let height: String
    let width: String
}
