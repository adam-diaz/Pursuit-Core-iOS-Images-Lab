//
//  ComicModel.swift
//  ImagesLab
//
//  Created by Adam Diaz on 12/10/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

// LINK: https://xkcd.com/614/info.0.json

struct ComicModel: Codable {
    let month: String
    let num: Int
    let year: String
    let img: String
    let title: String
}


