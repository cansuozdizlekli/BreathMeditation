//
//  CourseModel.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/19/22.
//

import Foundation


struct CourseModel {
    let title: String
    let type: CourseType
    let description: String
    let favCount: Int
    let listenCount: Int
    let sounds: [Sound]
}


enum CourseType: String {
    case BASIC
    case MUSIC
    case MEDITATION
}


struct Sound{
    let name: String
    let time: String
    let isMale: Bool
    let topics: [String]
}
