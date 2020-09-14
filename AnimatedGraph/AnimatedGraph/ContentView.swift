//
//  ContentView.swift
//  AnimatedGraph
//
//  Created by carol on 02/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 90, 30, 50, 50],
        [200, 150, 100, 50, 79, 85,64],
        [30,20,40, 60, 50, 32, 28],
        
    ]
    
    var body: some View {
        ZStack{
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            
            VStack {
            Text("Calory Intake").font(.system(size: 34)).fontWeight(.heavy)
            
            
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                    
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 24)
                
                HStack (spacing:16) {
                    BarView(day: "Su", value: dataPoints[pickerSelectedItem][0])
                    BarView(day: "M", value: dataPoints[pickerSelectedItem][1])
                    BarView(day: "T", value: dataPoints[pickerSelectedItem][2])
                    BarView(day: "W", value: dataPoints[pickerSelectedItem][3])
                    BarView(day: "T", value: dataPoints[pickerSelectedItem][4])
                    BarView(day: "F", value: dataPoints[pickerSelectedItem][5])
                    BarView(day: "Sa", value: dataPoints[pickerSelectedItem][6])
                
                    
                    
                }.padding(.top,24).animation(.default)
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BarView: View {
    
    var day: String
    var value: CGFloat
    
    
    var body: some View {
    VStack {
    ZStack (alignment: .bottom) {
        Capsule().frame(width: 30, height: 200).foregroundColor(Color("capsuleBackground"))
        Capsule().frame(width: 30, height: value).foregroundColor(.white)
        
    }
        Text(day).padding(.top,8)
    }
}
}

