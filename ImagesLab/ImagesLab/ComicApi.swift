//
//  ComicApi.swift
//  ImagesLab
//
//  Created by Adam Diaz on 12/10/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation
import UIKit

struct ComicApi {
    
  static func comicData(comicNum: Int,completion: @escaping (Result<ComicModel,AppError>) -> ()) {
      
    let link = "https://xkcd.com/\(comicNum)/info.0.json"
        
        NetworkHelper.shared.performingDataTasks(urlString: link) { (result) in
            switch result {
            case .failure(let taskError):
                completion(.failure(taskError))
            case .success(let data):
                do {
                    let comicData = try! JSONDecoder().decode(ComicModel.self, from: data)
                    completion(.success(comicData))
                } catch {
                    completion(.failure(.noData))
                }
            }
        }
    }
    
   static func comicImage(comicImage: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        
        NetworkHelper.shared.performingDataTasks(urlString: comicImage) { (result) in
            switch result {
            case .failure(let imageError):
                completion(.failure(imageError))
            case .success(let data):
                let imageFromData = UIImage(data: data)
                completion(.success(imageFromData!))
            }
        }
        
    }
    
}
