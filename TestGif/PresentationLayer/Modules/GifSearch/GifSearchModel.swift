//
//  GifSearchModel.swift
//  TestGif
//
//  Created by pro on 05.07.2020.
//  Copyright © 2020 pro. All rights reserved.
//

import Foundation

protocol IGifSearchModelDelegate: class {
    func didLoad(gifs: [GifData])
}

protocol IGifSearchModel {
    var delegate: IGifSearchModelDelegate? { get set }
    func loadGif(query: String)
}

class GifSearchModel: IGifSearchModel {

    weak var delegate: IGifSearchModelDelegate?
    var service: IGifeSearchService =  GifeSearchService()
    
    func loadGif(query: String) {
        service.loadGif(query: query) { (result: Result<[GifData], Error>) in
            switch result {
            case .success(let data):
                self.delegate?.didLoad(gifs: data)
            case .failure(_):
                 break
            }
        }
    }
}
