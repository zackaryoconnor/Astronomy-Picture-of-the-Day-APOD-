//
//  Data.swift
//  Astronomy Picture of the Day (APOD)
//
//  Created by Zackary O'Connor on 9/15/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import Foundation

struct APOD: Decodable {
    let url: String
    let explanation: String
    let title: String
}
