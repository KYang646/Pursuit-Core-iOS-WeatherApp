//
//  ImageHelper.swift
//  WeatherApp
//
//  Created by Kimball Yang on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
import UIKit

class ImageAPIClient {
    
    //Singleton
    private init() {}
    
    static let manager = ImageAPIClient()
    
    func getImage(from urlStr: String, completionHandler: @escaping (UIImage) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        //guard for URL not nil
        guard let url = URL(string: urlStr) else {
            return
        }
        
        //Call completionHandler
        let completion: (Data) -> Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {
                return
            }
            completionHandler(onlineImage) //call completionHandler
        }
        
        //call NetworkHelper
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
