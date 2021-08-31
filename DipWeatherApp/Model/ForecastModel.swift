//
//  ForecastModel.swift
//  DipWeatherApp
//
//  Created by Cyril on 31.08.21.
//

import Foundation


struct ForecastModel: Codable {
    let data: [Day]
    let city: String
    
    enum CodingKeys: String, CodingKey {
        case data
        case city = "city_name"
    }
    
    struct Day: Codable {
        let pressure: Double
        let sunset: Double
        let sunrise: Double
        let weather: Weather
        let precipitation: Double
        let minTemp: Double
        let maxTemp: Double
        let date: String
        let temperature: Double
        
        enum CodingKeys: String, CodingKey {
            case pressure = "pres"
            case sunset = "sunset_ts"
            case sunrise = "sunrise_ts"
            case weather
            case precipitation = "precip"
            case minTemp = "min_temp"
            case maxTemp = "max_temp"
            case date = "datetime"
            case temperature = "temp"
        }
    }
    
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}
