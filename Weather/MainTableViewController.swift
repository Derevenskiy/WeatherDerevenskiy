//
//  MainTableViewController.swift
//  Weather
//
//  Created by Артем Чернышов on 03.02.2021.
//  Copyright © 2021 Artem Chernyshov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

  let cities = [
    Cities(name: "Москва", lat: "55", lon: "37"),
    Cities(name: "Санкт-Петербург", lat: "59", lon: "30"),
    Cities(name: "Новосибирск", lat: "55", lon: "82"),
    Cities(name: "Екатеренбург", lat: "56", lon: "60"),
    Cities(name: "Казань", lat: "55", lon: "49"),
    Cities(name: "Нижний Новгород", lat: "56", lon: "44"),
    Cities(name: "Челябинск", lat: "55", lon: "61"),
    Cities(name: "Самара", lat: "53", lon: "50"),
    Cities(name: "Омск", lat: "54", lon: "73"),
    Cities(name: "Ростов-на-Дону", lat: "55", lon: "49"),
    Cities(name: "Уфа", lat: "54", lon: "56"),
    Cities(name: "Красноярск", lat: "56", lon: "93"),
    Cities(name: "Воронеж", lat: "51", lon: "39"),
    Cities(name: "Пермь", lat: "58", lon: "56"),
    Cities(name: "Волгоград", lat: "48", lon: "44"),
    Cities(name: "Краснодар", lat: "45", lon: "38"),
    Cities(name: "Саратов", lat: "54", lon: "32"),
    Cities(name: "Тюмень", lat: "57", lon: "65"),
    Cities(name: "Тольятти", lat: "53", lon: "49"),
    Cities(name: "Ижевск", lat: "56", lon: "53"),
    Cities(name: "Барнаул", lat: "53", lon: "83"),
    Cities(name: "Ульяновск", lat: "54", lon: "48"),
    Cities(name: "Иркутск", lat: "52", lon: "104"),
    Cities(name: "Хабаровск", lat: "48", lon: "135"),
    Cities(name: "Ярославль", lat: "57", lon: "39")
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    settingsNavigationController()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)

    settingsNavigationController()


  }

  // MARK: - SettingsNavigationController
  func settingsNavigationController() {

    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()

    if #available(iOS 11.0, *) {
      navigationController?.navigationBar.prefersLargeTitles = true
    }

    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
  }

  // MARK: - TableViewDataSource
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cities.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let city = cities[indexPath.row]

    cell.textLabel?.text = city.name

    return cell
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "WeatherVC" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let weatherVC = segue.destination as! WeatherViewController
        let city = cities[indexPath.row]

        weatherVC.city = city.name
        weatherVC.latitude = city.lat
        weatherVC.longitude = city.lon
      }
    }
  }
}
