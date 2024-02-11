//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Dev on 10/02/2024.
//

import SwiftUI

struct weekDaysTempStruct: Identifiable, Hashable {
    let id = UUID()
    var dayOfWeek: String
    var imageName: String
    var tempreture: Int
}

struct ContentView: View {
    @State private var isNight = false
    
    //arrayOfDictionaries
    var weekDaysTemp: [weekDaysTempStruct] =  [
        weekDaysTempStruct(dayOfWeek: "TUE", imageName: "cloud.sun.fill", tempreture: 76),
        weekDaysTempStruct(dayOfWeek: "TUE", imageName: "sun.max.fill", tempreture: 88),
        weekDaysTempStruct(dayOfWeek: "TUE", imageName: "wind.snow", tempreture: 55),
        weekDaysTempStruct(dayOfWeek: "TUE", imageName: "sunset.fill", tempreture: 60),
        weekDaysTempStruct(dayOfWeek: "TUE", imageName: "snow", tempreture: 25)
    ]
    
    var body: some View {
        ZStack{
            BackgroundColorView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Lahore, PK")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", tempreture: 76)
                
                HStack(spacing: 20) {
                    ForEach(weekDaysTemp, id: \.self) { weekDay in
                        WeatherDayView(
                            dayOfWeek: weekDay.dayOfWeek,
                            imagaeName: weekDay.imageName,
                            tempreture: weekDay.tempreture)
                    }
                }
                
                Spacer()
        
                Button(
                    action: { isNight.toggle() },
                    label: {
                        WeatherButton(
                            buttonTitle: "Change Day Time",
                            textColor: Color.blue,
                            backgroundColor: Color.white
                        )
                    }
                )
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imagaeName: String
    var tempreture: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imagaeName)
                .symbolRenderingMode(.multicolor)
                .resizable()
            //.foregroundColor(.red) used when .symbolRenderingMode(.hirarchical)
            //.foregroundStyle(.pink, .orange, .gray) used when .symbolRenderingMode(.palette)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(tempreture)*")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColorView : View {
    //used binding whenever you change the state of parent
    //@Binding var isNight : Bool
    var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
            colors: [isNight ? .black : Color.blue,
                     isNight ? .gray : Color.lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        //        ContainerRelativeShape()
        //            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
        //            .ignoresSafeArea()
    }
}

struct CityTextView : View {
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var tempreture: Int
    
    var body: some View {
        VStack(spacing:10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(tempreture) C")
                .font(.system(size: 70, weight: .medium,design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


