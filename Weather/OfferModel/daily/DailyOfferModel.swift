//
//  DailyOfferModel.swift
//  Weather
//
//  Created by Артем Чернышов on 10.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import Foundation

class DailyOfferModel: Codable {
  var dt: Double?
  var temp: TempOfferModel?
  var weather: [DailyWeatherOfferModel]?
}
