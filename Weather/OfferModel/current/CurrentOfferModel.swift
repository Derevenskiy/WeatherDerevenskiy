//
//  CurrentOfferModel.swift
//  Weather
//
//  Created by Артем Чернышов on 05.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import Foundation

class CurrentOfferModel: Codable {
  var dt: Double?
  var temp: Double?
  var humidity: Double?
  var wind_speed: Double?
  var weather: [weatherOfferModel]?
}
