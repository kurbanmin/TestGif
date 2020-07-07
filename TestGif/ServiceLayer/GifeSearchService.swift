//
//  GifeSearchService.swift
//  TestGif
//
//  Created by pro on 05.07.2020.
//  Copyright © 2020 pro. All rights reserved.
//

import Foundation

protocol IGifeSearchService {
    func loadGif(query: String, completion: @escaping ((Result<[GifData], Error>)) -> Void)
}

class GifeSearchService: IGifeSearchService {
    
    var networkManager: INetworkManager = NetworkManager()
    
    func loadGif(query: String, completion: @escaping ((Result<[GifData], Error>)) -> Void)  {
        let gifRequest = GifRequest(query: query)
        
        networkManager.perform(with: gifRequest) { (result: Result<GifResponse, Error>) in
            switch result{
            case .success(let gifResponse):
                completion(Result.success(gifResponse.data))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
