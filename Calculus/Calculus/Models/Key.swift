//
//  Key.swift
//  Calculus
//
//  Created by carol on 06/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import Foundation
import SwiftUI

enum KeyType {
    case Number
    case Operator
}

var operatorSymbols:[String:String] = [
    "+": "plus",
    "-": "minus",
    "*": "multiply",
    "/": "divide",
    "+/-": "plus.slash.minus",
    "%": "percent",
    "=": "equal"
]

struct Key:Identifiable {
    var id: UUID = UUID()
    var label:String
    var color:Color = Color.black
    var labelColor:Color = Color.white
    var type:KeyType = KeyType.Number
}
/*
var keys:[[Key]] = [
    [
        Key(label: "AC", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
        Key(label: "+/-", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
        Key(label: "%", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
        Key(label: "/", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
    ],
    [
        Key(label: "7"),
        Key(label: "8"),
        Key(label: "9"),
        Key(label: "*", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
    ],
    [
       Key(label: "4"),
       Key(label: "5"),
       Key(label: "6"),
        Key(label: "-", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
    ],
    
    [
       Key(label: "1"),
       Key(label: "2"),
       Key(label: "3"),
        Key(label: "+", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
    ],
    
    [
       Key(label: "0"),
       Key(label: "."),
        Key(label: "=", color: Color.orange, labelColor: Color.white, type: KeyType.Operator)
    ]
]
*/
