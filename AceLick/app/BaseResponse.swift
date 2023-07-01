//
//  BaseResponse.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 01/07/2023.
//

import UIKit

struct BaseResponse<T: Decodable>: Decodable {
    var status: Bool
    var message: String
    var data: T
}
