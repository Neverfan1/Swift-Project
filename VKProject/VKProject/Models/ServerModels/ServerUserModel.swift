//
//  ServerUserModel.swift
//  VKProject
//
//  Created by Данила Парамин on 24.08.2022.
//

import Foundation

struct ServerUserModel: Codable {
    let id: Int?
    let bdate: String?
    let city, country: City?
    let photoMaxOrig: String?
    let about, activities: String?
    let followersCount, commonCount, university: Int?
    let universityName: String?
    let faculty: Int?
    let facultyName: String?
    let graduation: Int?
    let counters: [String: Int]
    let firstName, lastName: String?
    let screenName: String?
    let status: String?
    let online: Int?
    let onlineMobile: Int?
    let canAccessClosed, isClosed: Bool?

    enum CodingKeys: String, CodingKey {
        case id, bdate, city, country, status, online
        case photoMaxOrig = "photo_max_orig"
        case about, activities
        case followersCount = "followers_count"
        case commonCount = "common_count"
        case university
        case universityName = "university_name"
        case faculty
        case facultyName = "faculty_name"
        case graduation, counters
        case firstName = "first_name"
        case lastName = "last_name"
        case screenName = "screen_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case onlineMobile = "online_mobile"
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let title: String
}

