//
//  ResultView.swift
//  Calculus
//
//  Created by carol on 06/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var calculatorVM:CalculatorVM
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(calculatorVM.result)
                    .foregroundColor(Color.white)
                    .font(.system(size: CGFloat(calculatorVM.fontSize)))
                    .padding(.trailing, 30)
            }
        }
    }
}

