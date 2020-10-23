//
//  main.swift
//  HammingCode
//
//  Created by Valeria Muldt on 20.10.2020.
//

import Foundation

func main() {
    print("ВВЕДИТЕ n:")

    if let x = readLine(), let n = Int(x) {
        print("")
        let hammingCode = HammingCode(n: n)
        hammingCode.find()
    }
}

main()
