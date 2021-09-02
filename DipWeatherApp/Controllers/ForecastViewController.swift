//
//  ViewController.swift
//  DipWeatherApp
//
//  Created by Cyril on 30.08.21.
//

import UIKit
import CoreLocation

final class ForecastViewController: UIViewController {

    //MARK: - @IBOutlets
    
    @IBOutlet weak var numberOfDaysButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var forecastTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    private var selectedCity = ""
    private var fullUrl = ""
    private var daysSelected = 3
    private let url = "https://api.weatherbit.io/v2.0/forecast/daily?"
    private let apiKey = "&key=5bdf01b8ef6d43ffb704223944098a6a"

    let cities: [String] = [
        "Current location", "Minsk", "Vilnius",
        "Moscow", "Riga", "Tallinn", "Berlin",
        "Warsaw", "Amsterdam", "London"
    ]
    let viewModel = ViewModel()
    let locationManager = CLLocationManager()
    var currentLocation = CLLocation()

    var netWorking: Networking?
    var forecastModel: ForecastModel?
    
    //MARK: - ViewDidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        numberOfDaysButton.layer.cornerRadius = 10
        
        locationPicker.delegate = self
        locationPicker.dataSource = self
        
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        activityIndicator.startAnimating()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        getForecast()
    }
    
    //MARK: - @IBAction

    @IBAction func daysButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: - Get Forecast Methods
    
    func getForecast() {
        if locationPicker.selectedRow(inComponent: 0) != 0 {
            selectedCity = cities[locationPicker.selectedRow(inComponent: 0)]
            fullUrl = url + "city=\(selectedCity)" + apiKey + "&days=\(daysSelected)"
        } else if locationPicker.selectedRow(inComponent: 0) == 0 {
            let lat = currentLocation.coordinate.latitude
            let lon = currentLocation.coordinate.longitude
            fullUrl = url + "lat=\(lat)" + "&lon=\(lon)" + apiKey + "&days=\(daysSelected)"
        }
        weatherRequest()
    }
    
    func weatherRequest() {
        viewModel.forecastModel.bind { forecast in
            DispatchQueue.main.async {
                if forecast != nil {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.forecastTableView.reloadData()
                } else {
                    self.activityIndicator.startAnimating()
                    self.activityIndicator.isHidden = false
                }
            }
        }
        viewModel.fetchForecast(url: fullUrl)
    }
}

