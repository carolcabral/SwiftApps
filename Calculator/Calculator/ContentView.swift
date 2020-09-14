//
//  ContentView.swift
//  Calculator
//
//  Created by carol on 02/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, dot
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .dot: return "."
            
            
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .percent: return "%"
        case .plusMinus: return "+-"
            
        default: return "AC"
            
            
        }
    }
    var backgroundColor: Color {
        switch self {
        case .equals, .plus, .minus, .multiply, .divide:
            return Color (.orange)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
            
        }
    }
}

class Globalenvironment: ObservableObject {
    
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton){
        self.display = calculatorButton.title
    }
}


struct ContentView: View {
    
    @EnvironmentObject var env: Globalenvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
         [.seven, .eight, .nine, .multiply],
         [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero,  .dot, .equals]
    ]

    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing:12) {
            
                
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white).font(.system(size: 64))

                }.padding()
                
                
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)

                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    

}


struct CalculatorButtonView: View {
    var button: CalculatorButton
    @EnvironmentObject var env: Globalenvironment
    
    var body: some View {
    Button(action: {
        self.env.receiveInput(calculatorButton: self.button)
        }) {
        Text(button.title).font(.system(size: 32)).frame(width: self.buttonWidth(button: button), height: self.buttonWidth(button: .one)).foregroundColor(.white).background(button.backgroundColor).cornerRadius(self.buttonWidth(button: button))
    
        }
        
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12 ) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12 ) / 4
    }

}

