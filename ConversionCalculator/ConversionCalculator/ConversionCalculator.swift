//
//  ConversionCalculator.swift
//  ConversionCalculator
//
//  Created by Julia Wopata on 5/9/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import Foundation

class ConversionCalculator {
    var converters: [Converter]
    var currentConverterIndex: Int
    init() {
        converters = [Converter(label: "Fahrenheit to Celsius",inputUnit: "°F", outputUnit: "°C"),
                      Converter(label: "Celsius to Fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                      Converter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
                      Converter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi")]
        currentConverterIndex = 0
    }
    
    func currentConverter() -> Converter {
        return converters[currentConverterIndex]
    }
    
    func convert(input: Float) -> Float {
        switch currentConverterIndex {
        case 0: //f->c
            return (input-32)*(5/9)
        case 1: //c->f
            return input*(9/5)+32
        case 2: //mi->km
            return input*1.609344
        case 3: //km->mi
            return input/1.609344
        default:
            return 0
        }
    }
}
