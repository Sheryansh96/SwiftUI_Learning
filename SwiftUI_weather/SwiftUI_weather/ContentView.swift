//
//  ContentView.swift
//  SwiftUI_weather
//
//  Created by Shreyas on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            backgroundView(color1: isNight ? .black : .blue,
                           color2: isNight ? .gray : Color("lightBlue"))
            VStack(spacing:8){
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight:.medium, design: .default))
                    .foregroundColor(.white)
                    .padding()

                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:180, height:180)
                    
                    Text("76°")
                        .font(.system(size: 70,weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                HStack(spacing:20){
                    WeatherDayView(dayofWeek: "Tue", ImageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayofWeek: "Wed", ImageName: "cloud.sun.fill", temperature: 73)
                    WeatherDayView(dayofWeek: "Thu", ImageName: "cloud.sun.fill", temperature: 77)
                    WeatherDayView(dayofWeek: "Fri", ImageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayofWeek: "Sat", ImageName: "snow", temperature: 74)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    weatherButton(title: "Click", backgroundColor: .blue, foregroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayofWeek: String
    var ImageName:String
    var temperature:Int
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height:40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    var color1 : Color
    var color2: Color
    var body: some View {
        LinearGradient(colors: [color1,color2],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


