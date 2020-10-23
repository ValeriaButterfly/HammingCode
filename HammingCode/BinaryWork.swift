//
//  BinaryWork.swift
//  HammingCode
//
//  Created by Valeria Muldt on 23.10.2020.
//

import Foundation

class BinaryWork {
    
    private init() { }
    
    static func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
}
