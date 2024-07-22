//
//  Number.swift
//  MVP_Prac
//
//  Created by Yeji Seo on 7/22/24.
//

import Foundation

struct NumberRecord: Codable, Hashable{
    let text: String
    var number: Int
    let found: Bool
    let type: String
}
