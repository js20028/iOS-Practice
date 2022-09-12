//
//  Beer.swift.swift
//  Brewery
//
//  Created by 곽재선 on 2022/09/09.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodPairing: [String]?
    
    // 실제 받아오는 태그라인 값을 보기 좋게 수정
    var tagLine: String {
        // taglineString을 ". " 단위로 구분해서 배열로 저장
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        // id, name, description 은 이름이 같음
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodPairing = "food_pairing"
    }
    
}
