//
//  WeatherViewController.swift
//  Weather
//
//  Created by Артем Чернышов on 04.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

  var city = ""
  var latitude = ""
  var longitude = ""

  @IBOutlet weak var cityNavigationItem: UINavigationItem!
  

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.shadowImage = UIImage()

    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    cityNavigationItem.title = city
    }
}
