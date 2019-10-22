//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Kimball Yang on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation


import Foundation

struct WeatherAPIClient {
    
    private init() {}
    
    static let manager = WeatherAPIClient()
    
    
    func getWeather(from urlStr: String,
                     completionHandler: @escaping ([Weather]) -> Void,
                     errorHandler: @escaping (Error) -> Void) {
        print(urlStr)
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let weatherData = try JSONDecoder().decode(WeatherResults.self, from: data)
                completionHandler(weatherData.daily.data)
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
