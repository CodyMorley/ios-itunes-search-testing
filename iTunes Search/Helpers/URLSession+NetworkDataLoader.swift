//
//  URLSession+NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Cody Morley on 6/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension URLSession: NetworkDataLoader {
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        //We don't care about the data, response, error here. we will forward these to whatever is calling loadData().
        
        dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
}
