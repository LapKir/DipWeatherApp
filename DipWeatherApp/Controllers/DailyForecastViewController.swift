//
//  DailyForecastViewController.swift
//  DipWeatherApp
//
//  Created by Cyril on 1.09.21.
//

import UIKit

class DailyForecastViewController: UIViewController {
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    
    var forecast: ForecastModel?
    var totalDays = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 10
        
        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
