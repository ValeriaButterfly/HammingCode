//
//  Matrix.swift
//  HammingCode
//
//  Created by Valeria Muldt on 23.10.2020.
//

import Foundation

class Matrix {
    
    private init() {}
    
    
    static func printH(_ matrix: [[UInt8]], with r: Int, and n: Int) {
    //    print("MATRIX H")
        for index in 0...r-1 {
            for j in 0...n-1 {
                print(matrix[j][index], separator: "", terminator: " ")
            }
            print("")
        }
    }

    static func correctH(_ matrix: [[UInt8]], with r: Int, and n: Int) {
    //    print("CORRECT MATRIX H")
        
        var matrixA = [[UInt8]]()
        var matrixE = [[UInt8]]()
        
        
        for index in stride(from: n, through: 1, by: -1) {
            if (index & (index - 1)) == 0 {
                matrixE.append(matrix[index-1])
            } else {
                matrixA.append(matrix[index-1])
            }
        }
        
        let correctMatrix = matrixA + matrixE
        
        printH(correctMatrix, with: r, and: n)
        
    //    print("----------------------")
        print("")
        print("MATRIX G")
        
        matrixG(matrixA, r: r, n: n)
    }

    static func matrixG(_ matrixA: [[UInt8]], r: Int, n: Int) {
        var transparentMatrixA = [[UInt8]]()
        var transparentStolb = [UInt8]()
        
        for j in 0...matrixA.count-1 {
            for index in 0...matrixA[j].count-1 {
    //            print(matrixA[j][index], separator: "", terminator: " ")
                transparentStolb.append(matrixA[j][index])
            }
    //        print("")
            transparentMatrixA.append(transparentStolb)
            transparentStolb.removeAll()
        }
        
    //    print("-------------------------")
    //    print(transparentMatrixA)
        
        let matrixE = generateMatrixE(with: matrixA.count)
        
        var matrixG = [[UInt8]]()
        
        for index in 0...matrixE.count - 1 {
            matrixG.append(matrixE[index]+matrixA[index])
        }
        
    //    print("-----------------------")
    //    print("MATRIX G")
        
        for j in 0...matrixG.count-1 {
            for index in 0...matrixG[j].count-1 {
                print(matrixG[j][index], separator: "", terminator: " ")
            }
            print("")
        }
    }

    static func generateMatrixE(with n: Int) -> [[UInt8]] {
        var matrixE = [[UInt8]]()
        
        for index in stride(from: n-1, through: 0, by: -1) {
            let str = String( Int(pow(2, Double(index))) , radix: 2)
            let strFull = BinaryWork.pad(string: str, toSize: n)
            var matrixStolb = [UInt8]()
            
            for symbol in strFull {
                if let binSymbol = UInt8(String(symbol)) {
                    matrixStolb.append(binSymbol)
                }
            }
            
            matrixE.append(matrixStolb)
            
        }
        
    //    print(matrixE)
        
        return matrixE
    }
}
