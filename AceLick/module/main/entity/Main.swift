//
//  Auth.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

struct Main: Encodable {
    var email: String
    var password: String
}

struct MainResponse: Decodable { }
