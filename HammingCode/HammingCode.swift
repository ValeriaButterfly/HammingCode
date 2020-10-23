//
//  HammingCode.swift
//  HammingCode
//
//  Created by Valeria Muldt on 23.10.2020.
//

import Foundation

class HammingCode {
    var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func find() {
        
        let r = { () -> Int in
            var x = log2(Double(self.n)+1)
            if x > round(x) {
                x = round(x)+1
                return Int(x)
            } else {
                return Int(round(x))
            }
        }
        
        if n == Int(pow(2, Double(r()-1))) {
    //        print("something")
            exit(0)
        }
        
    //    print(r())
        
        var k = Int(pow(2, Double(r()))) - r() - 1
    //    print(k)
        
        let n2 = Int(pow(2, Double(r()))) - 1
    //    print(n2)
        
        let nr = n2 > n ? n2-n : 0
        k = nr != 0 ? k-nr : k
        
    //    print(nr)
    //    print(k)
        
        var matrixH = [[UInt8]]()
        
        for index in 1...n {
            let str = String(index, radix: 2)
            let strFull = BinaryWork.pad(string: str, toSize: r())
            var matrixStolb = [UInt8]()
            
            for symbol in strFull {
                guard let binSymbol = UInt8(String(symbol)) else { return }
                //            print(binSymbol)
                matrixStolb.append(binSymbol)
            }
            
            matrixH.append(matrixStolb)
            
        }
        
    //    print(matrixH)
        
        print("MATRIX H")
        Matrix.printH(matrixH, with: r(), and: n)
        print("")
        print("CORRECT MATRIX H")
        Matrix.correctH(matrixH, with: r(), and: n)
        
    //    print("FIND SYNDROME FUNCTION")
        print("")
        
        if n == Int(pow(2, Double(r()))-1) {
            ErrorSyndrom.find(matrixH, for: k, n: n)
        }
    }
}
