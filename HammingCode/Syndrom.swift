//
//  Syndrom.swift
//  HammingCode
//
//  Created by Valeria Muldt on 23.10.2020.
//

import Foundation

class ErrorSyndrom {
    
    private init() {}
    
    static func find(_ matrixH: [[UInt8]],  for k: Int, n: Int) {
        
        var wordX = [UInt8]()
        let r = n - k
        
        print("ВВЕДИТЕ ПОСЛЕДОВАТЕЛЬНОСТЬ ИЗ 0 и 1")
        for index in 1...n {
            if (index & (index - 1)) != 0 {
                guard let x = readLine() else { return }
                let intX = x.map( { UInt8(String($0)) } )
                wordX.append(intX[0]!)
                //            print(index)
                //            print(x)
            } else {
                wordX.append(0)
            }
        }
        
        var sum: UInt8 = 0b0
        var sumArray = [UInt8]()
        for ind in stride(from: r-1, through: 0, by: -1) {
            for j in 0...n-1 {
                if matrixH[j][ind] != 0 {
                    sum ^= matrixH[j][ind]
                }
            }
            //        print(sum)
            sumArray.append(sum)
            sum = 0b0
        }
        
        
        
    //    print(wordX)
    //    print(sumArray)
        
        var count = 0
        for index in 1...n {
            if (index & (index - 1)) == 0 {
    //            print(index)
                wordX[index-1] = sumArray[count]
                count += 1
            }
        }
        
        sumArray.removeAll()
        count = 0
        
    //    print(wordX)

        for ind in stride(from: r-1, through: 0, by: -1) {
            for j in 1...n {
                if matrixH[j-1][ind] != 0 && (j & (j - 1)) != 0   {
    //                print(matrixH[j-1][ind])
    //                print(j)
                    sum ^= wordX[j-1]
                }
            }
            
            sumArray.append(sum)
            sum = 0b0
        }
        
    //    print("!!!!!!")
    //    print(sumArray)
        
        for index in 1...n {
            if (index & (index - 1)) == 0 {
    //            print(index)
                wordX[index-1] ^= sumArray[count]
                count += 1
            }
        }

    //    print("!!!!!!!")
    //    print(wordX)
        sumArray.removeAll()
        
        print("ВАШЕ КОДОВОЕ СЛОВО - \(wordX)")
        
    //    print("ВВЕДИТЕ ЛЮБОЕ ЧИСЛО ОТ 0 до \(n-1)")
    //    guard let x = readLine() else { return }
    //    print(x)
        
        let x = Int.random(in: 1...n)
    //    let x = 7
    //    print(x)
        
        wordX[x-1] = wordX[x-1] == 0 ? 1 : 0
        
        print("")
        print("РАНДОМНЫМ ОБРАЗОМ ПРИ ВЫХОДЕ ИЗ КАНАЛА В ВАШЕМ ВЕКТОРЕ ОБРАЗОВАЛАСЬ ОШИБКА")
        print("Y = \(wordX)")
    //    print("X = \(wordX)")
        
        
        var syndrome = [UInt8]()
        
        for i in 0...r-1 {
            for j in 0...n-1 {
                sum = wordX[j] & matrixH[j][i]
    //            print(sum)
                sumArray.append(sum)
            }
            
            
            syndrome.append(sumArray.reduce(0, ^))
    //        print(sumArray)
            sumArray.removeAll()
        }
        
        
    //    print(syndrome)
        let decimalSyndrom = { () -> Int in
            var binary = ""
            for s in syndrome {
                binary += String(s)
            }
            
            guard let number = Int(binary, radix: 2) else {
                return 0
            }
            
            return number
        }
        
        print("СИНДРОМ S = \(syndrome)")
        print("ОШИБКА В РАЗРЯДЕ № \(decimalSyndrom())")
        
    }
}
