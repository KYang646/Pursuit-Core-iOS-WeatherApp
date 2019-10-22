//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Kimball Yang on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

class WeatherAPIClient {
    
    static let manager = WeatherAPIClient()
    
    static func getSearchResultsURLStr(from latitude: String, longitude: String) -> String {
        return "https://api.darksky.net/forecast/\(162593bfd27b6ae62ec0b7dbaaa429d6.darkSky)/\(latitude),\(longitude)?exclude=[minutely,hourly,alerts,flags]"
    }
    
    func getWeather(urlStr: String, completionHandler: @escaping (Result<[Forecast], AppError>) -> ())  {
        
        guard let url = URL(string: urlStr) else {
            print(AppError.badURL)
            return
        }
        
        NetworkHelper.manager.performDataTask(withURL: url, andMethod: .get) { (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let weatherInfo = try Weather.decodeWeatherFromData(from: data)
                    completionHandler(.success(weatherInfo.daily.data))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
                
            }
        }
    }
    
    private init() {}
}
