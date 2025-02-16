//
//  ContentView.swift
//  WeatherAndMap
//
//  Created by 鴛海剛 on 2025/02/15.
//

import SwiftUI

struct ContentView: View {
    //APIへリクエストしたり、レスポンスの値を保持するオブジェクト
    @StateObject private var weatherVM = WeatherViewModel()
    @StateObject var locationManager = LocationManager()//位置情報管理のオブジェクト
    // 八幡平市大更の緯度・経度
      var lat: Double = 39.91167
      var lon: Double = 141.093459
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    DailyWeatherView(weatherVM: weatherVM)
                    HourlyWeatherView(weatherVM: weatherVM)
                }
                .padding()
            }
            .navigationTitle("現在地: \(locationManager.address)")//画面上部のタイトル
            .navigationBarTitleDisplayMode(.inline)//タイトルの書式
            
            
        }
        .padding()
        
        .onAppear {
                 weatherVM.request3DaysForecast(lat: lat, lon: lon)
              }
    }
}

#Preview {
    ContentView()
}
