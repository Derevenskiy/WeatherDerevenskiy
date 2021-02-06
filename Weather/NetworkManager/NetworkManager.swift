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

  func getWeather(lat: String, lon: String, result: @escaping ((OfferModel?) -> ())) {

    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.openweathermap.org"
    urlComponents.path = "/data/2.5/onecall"
    urlComponents.queryItems = [URLQueryItem(name: "lat", value: lat),
                                URLQueryItem(name: "lon", value: lon),
                                URLQueryItem(name: "exclude", value: "minutely,hourly"),
                                URLQueryItem(name: "lang", value: "ru"),
                                URLQueryItem(name: "units", value: "metric"),
                                URLQueryItem(name: "appid", value: "5c5ae62a66d39be8f877cb6cf8c7bd9")]

    var request = URLRequest(url: urlComponents.url!)
    request.httpMethod = "GET"

    let task = URLSession(configuration: .default)

    task.dataTask(with: request) { (data, response, error) in
      if error == nil {
        let decoder = JSONDecoder()
        var decoderOfferModel: OfferModel?

        if data != nil {
          decoderOfferModel = try? decoder.decode(OfferModel.self, from: data!)
        }
        result(decoderOfferModel)
      } else {
        print(error as Any)
      }
    }.resume()
  }
  private init() {}
}
