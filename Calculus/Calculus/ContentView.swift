//
//  ContentView.swift
//  Calculus
//
//  Created by carol on 06/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var calculatorVM:CalculatorVM = CalculatorVM()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ResultView()
                KeyPadView()
            }
            
        }.environmentObject(calculatorVM)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
