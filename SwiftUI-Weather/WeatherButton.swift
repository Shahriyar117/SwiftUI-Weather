//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Dev on 11/02/2024.
//

import SwiftUI;

struct WeatherButton : View {
    var buttonTitle : String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        Text(buttonTitle)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
