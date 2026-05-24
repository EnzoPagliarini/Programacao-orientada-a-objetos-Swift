//Exercicios aula 1

import Foundation

func calcular(nums: [Int]) {
    var numPositivo: [Int] = []
    var numNegativo: [Int] = []
    var numZero: [Int] = []

    for num in nums {
        if num > 0 {
            numPositivo.append(num)
        } else if num < 0 {
            numNegativo.append(num)
        } else {
            numZero.append(num)
        }
    }

    
    let total = nums.count
    
    let positivo = total > 0 ? String(format: "%.6f", Double(numPositivo.count) / Double(total)) : "0.000000"
    let negativo = total > 0 ? String(format: "%.6f", Double(numNegativo.count) / Double(total)) : "0.000000"
    let zero = total > 0 ? String(format: "%.6f", Double(numZero.count) / Double(total)) : "0.000000"

    print(positivo)
    print(negativo)
    print(zero)
}
var numeros: [Int] = [-4, 3, -9, 0, 4, 1]

calcular(nums: numeros)

