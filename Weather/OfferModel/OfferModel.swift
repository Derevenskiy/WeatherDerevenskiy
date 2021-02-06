//
//  OfferModel.swift
//  Weather
//
//  Created by Артем Чернышов on 05.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import Foundation

class OfferModel: Codable {
  var lat: Int?
  var lon: Int?
  var timezone: String?
  var current: CurrentOfferModel?
}
