//
//  AppError.swift
//  ImagesLab
//
//  Created by Adam Diaz on 12/10/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError
    case badStatusCode(Int)
    case badMimeType(String)
}
