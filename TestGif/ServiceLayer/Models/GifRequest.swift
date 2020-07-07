//
//  GifRequest.swift
//  TestGif
//
//  Created by pro on 05.07.2020.
//  Copyright © 2020 pro. All rights reserved.
//

import Foundation

class GifRequest: IRequest {
    private let baseUrl = "https://api.giphy.com/v1/gifs/search"
    private let apiKey = "0lJ9waiO6PZINh3T2NcP4WRQacfqERjZ"
    private var query: String
    private let limit = "20"
    private let offset = "0"
    private let rating = "g"
    private let lang = "en"

    private var getParameters: [String: String] {
        return ["apiKey": apiKey,
                "q": query,
                "limit": limit,
                "rating": rating,
                "lang": lang]
    }

    private var urlString: String {
        let getParams = getParameters.compactMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        return baseUrl + "?" + getParams
    }

    var urlRequest: URLRequest? {
        if let url = URL(string: urlString) {
            return URLRequest(url: url)
        }
        return nil
    }

    init(query: String) {
        self.query = query
    }
}
