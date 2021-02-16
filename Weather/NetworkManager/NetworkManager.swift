//
//  NetworkManager.swift
//  Weather
//
//  Created by Артем Чернышов on 05.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import Foundation

class NetworkManager {
  static let shared: NetworkManager = NetworkManager()

 
  // MARK: - resultWeatherApi
  func resultWeatherApi(lat: String, lon: String, result: @escaping ((OfferModel?) -> ())) {

    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly&lang=ru&units=metric&appid=75c5ae62a66d39be8f877cb6cf8c7bd9") else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard let data = data else { return }
      guard error == nil else {return}

      do {
        let decode = try JSONDecoder().decode(OfferModel.self, from: data)

        result(decode)
      } catch let error {
        print(error)
      }
      }.resume()
  }
  private init() {}
}
