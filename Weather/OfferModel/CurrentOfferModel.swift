//
//  CurrentOfferModel.swift
//  Weather
//
//  Created by Артем Чернышов on 05.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import Foundation

class CurrentOfferModel: Codable {
  var dt: Int?
  var temp: Int?
  var humidity: Int?
  var wind_speed: Int?
  var weather: [weatherOfferModel]?
}
