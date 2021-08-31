//
//  ViewController.swift
//  DipWeatherApp
//
//  Created by Cyril on 30.08.21.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfDaysButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var forecastTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    private var selectedCity = ""
    private var fullUrl = ""
    private var daysSelected = 3
    private let url = "https://api.weatherbit.io/v2.0/forecast/daily?city="
    private let apiKey = "&key=5bdf01b8ef6d43ffb704223944098a6a"
    
    let cities: [String] = [
        "Current location", "Minsk", "Vilnius",
        "Moscow", "Riga", "Tallinn", "Berlin",
        "Warsaw", "Amsterdam", "London"
    ]
    
    //MARK: - ViewDidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfDaysButton.layer.cornerRadius = 10
        
        locationPicker.delegate = self
        locationPicker.dataSource = self
        
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        activityIndicator.startAnimating()
    }

    @IBAction func daysButtonPressed(_ sender: UIButton) {
        
    }
    
}

