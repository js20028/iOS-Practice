//
//  WeatherInformation.swift
//  Weather
//
//  Created by 곽재선 on 2022/07/10.
//

import Foundation

struct WeatherInformation: Codable {    // Codable은 자신을 변환하거나 외부표현(json 등)으로 변환될 수 있는 타입, json decoding 과 encoding이 모두 가능(WeatherInformation 객체를 json 형태로 만들수있고 그 반대도 가능함)
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {    // 구조체에서 정의한 프로퍼티와 서버에서의 json 키값의 이름이 달라도 매핑 가능
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
