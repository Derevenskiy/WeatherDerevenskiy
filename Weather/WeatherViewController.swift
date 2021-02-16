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
  var lat = ""
  var lon = ""

  // MARK: - CurrentWeather
  @IBOutlet weak var iconWeatherImage: UIImageView!

  @IBOutlet weak var tempLabel: UILabel!

  @IBOutlet weak var currentTempMinLabel: UILabel!
  @IBOutlet weak var currentTempMaxLabel: UILabel!

  @IBOutlet weak var windSpeedLabel: UILabel!
  @IBOutlet weak var alertsLabel: UILabel!

  @IBOutlet weak var weatherActivityIndicator: UIActivityIndicatorView!

  @IBOutlet weak var cityNavigationItem: UINavigationItem!

  // MARK: - OneDayAfterCurrentWeather
  @IBOutlet weak var oneDayOfWeekLabel: UILabel!

  @IBOutlet weak var iconOneDayWeatherImage: UIImageView!
  @IBOutlet weak var tempMinMaxOneDayLabel: UILabel!

  // MARK: - TwoDayAfterCurrentWeather
  @IBOutlet weak var twoDayOfWeekLabel: UILabel!

  @IBOutlet weak var iconTwoDayWeatherImage: UIImageView!
  @IBOutlet weak var tempMinMaxTwoDayLabel: UILabel!

  // MARK: - ThreeDayAfterCurrentWeather
  @IBOutlet weak var threeDayOfWeekLabel: UILabel!

  @IBOutlet weak var iconThreeDayWeatherImage: UIImageView!
  @IBOutlet weak var tempMinMaxThreeDayLabel: UILabel!

  // MARK: - FourDayAfterCurrentWeather
  @IBOutlet weak var fourDayOfWeekLabel: UILabel!

  @IBOutlet weak var iconFourDayWeatherImage: UIImageView!
  @IBOutlet weak var tempMinMaxFourDayLabel: UILabel!

  // MARK: - FiveDayAfterCurrentWeather
  @IBOutlet weak var fiveDayOfWeekLabel: UILabel!

  @IBOutlet weak var iconFiveDayWeatherImage: UIImageView!
  @IBOutlet weak var tempMinMaxFiveDayLabel: UILabel!
  

  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.shadowImage = UIImage()

    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    cityNavigationItem.title = city

    weatherActivityIndicator.startAnimating()

    NetworkManager.shared.resultWeatherApi(lat: lat, lon: lon) { (model) in
      DispatchQueue.main.async {

        // currentWeather
        self.tempLabel.text = String(Int(model!.current!.temp!)) + " °"
        self.currentTempMinLabel.text = String(Int(model!.daily![0].temp!.min!)) + " °"
        self.currentTempMaxLabel.text = String(Int(model!.daily![0].temp!.max!)) + " °"

        self.windSpeedLabel.text = "Ветер - " + String(model!.current!.wind_speed!) + " м/с"

        let descriptionCurrent = model!.current!.weather![0].description!

        self.changingWeatherPicture(description: descriptionCurrent, imageView: self.iconWeatherImage)

        // oneDayAfterCurrent
        let dateOneDayAfterCurrent = Date(timeIntervalSince1970: model!.daily![1].dt!)
        self.oneDayOfWeekLabel.text = self.dayOfWeek(date: dateOneDayAfterCurrent)

        let descriptionOneDayAfterCurrent = model!.daily![1].weather![0].description!

        self.changingWeatherPicture(description: descriptionOneDayAfterCurrent, imageView: self.iconOneDayWeatherImage)

        self.tempMinMaxOneDayLabel.text = String(Int(model!.daily![1].temp!.min!)) + "/" + String(Int(model!.daily![1].temp!.max!))

        // twoDayAfterCurrent
        let dateTwoDayAfterCurrent = Date(timeIntervalSince1970: model!.daily![2].dt!)
        self.twoDayOfWeekLabel.text = self.dayOfWeek(date: dateTwoDayAfterCurrent)

        let descriptionTwoDayAfterCurrent = model!.daily![2].weather![0].description!

        self.changingWeatherPicture(description: descriptionTwoDayAfterCurrent, imageView: self.iconTwoDayWeatherImage)

        self.tempMinMaxTwoDayLabel.text = String(Int(model!.daily![2].temp!.min!)) + "/" + String(Int(model!.daily![2].temp!.max!))

        // threeDayAfterCurrent
        let dateThreeDayAfterCurrent = Date(timeIntervalSince1970: model!.daily![3].dt!)
        self.threeDayOfWeekLabel.text = self.dayOfWeek(date: dateThreeDayAfterCurrent)

        let descriptionThreeDayAfterCurrent = model!.daily![3].weather![0].description!

        self.changingWeatherPicture(description: descriptionThreeDayAfterCurrent, imageView: self.iconThreeDayWeatherImage)

        self.tempMinMaxThreeDayLabel.text = String(Int(model!.daily![3].temp!.min!)) + "/" + String(Int(model!.daily![3].temp!.max!))

        // fourDayAfterCurrent
        let dateFourDayAfterCurrent = Date(timeIntervalSince1970: model!.daily![4].dt!)
        self.fourDayOfWeekLabel.text = self.dayOfWeek(date: dateFourDayAfterCurrent)

        let descriptionFourDayAfterCurrent = model!.daily![4].weather![0].description!

        self.changingWeatherPicture(description: descriptionFourDayAfterCurrent, imageView: self.iconFourDayWeatherImage)

        self.tempMinMaxFourDayLabel.text = String(Int(model!.daily![4].temp!.min!)) + "/" + String(Int(model!.daily![4].temp!.max!))

        // fiveDayAfterCurrent
        let dateFiveDayAfterCurrent = Date(timeIntervalSince1970: model!.daily![5].dt!)
        self.fiveDayOfWeekLabel.text = self.dayOfWeek(date: dateFiveDayAfterCurrent)

        let descriptionFiveDayAfterCurrent = model!.daily![5].weather![0].description!

        self.changingWeatherPicture(description: descriptionFiveDayAfterCurrent, imageView: self.iconFiveDayWeatherImage)

        self.tempMinMaxFiveDayLabel.text = String(Int(model!.daily![5].temp!.min!)) + "/" + String(Int(model!.daily![5].temp!.max!))

        self.weatherActivityIndicator.hidesWhenStopped = true
        self.weatherActivityIndicator.stopAnimating()
      }
    }
  }

  // MARK: - func dayOfWeek
  func dayOfWeek(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE"
    let weekDay = dateFormatter.string(from: date)

    return weekDay
  }

  // MARK: - func ChangingWeatherPicture
  func changingWeatherPicture(description: String, imageView: UIImageView) {
    switch description {
    case "снег":
      imageView.image = UIImage(named: "Снег")
    case "небольшой снег":
      imageView.image = UIImage(named: "Снег")
    case "ясно":
      imageView.image = UIImage(named: "Ясно")
    case "облачно с прояснениями":
      imageView.image = UIImage(named: "Облачно")
    case "пасмурно":
      imageView.image = UIImage(named: "Облачно")
    case "переменная облачность":
      imageView.image = UIImage(named: "Облачно")
    case "дождь":
      imageView.image = UIImage(named: "Дождь")
    case "снег с дождем":
      imageView.image = UIImage(named: "Снег")
    case "небольшой дождь":
      imageView.image = UIImage(named: "Дождь")
    case "дождь с грозой":
      imageView.image = UIImage(named: "Дождь с грозой")
    default:
      break
    }
  }
}
