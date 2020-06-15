//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Cody Morley on 6/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    //We're not concerned with HOW the adopter of this protocol gets the data just that it gets it from somewhere.
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
