//
//  Auth.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

struct Auth: Encodable {
    var email: String
    var password: String
}

struct AuthResponse: Decodable { }
