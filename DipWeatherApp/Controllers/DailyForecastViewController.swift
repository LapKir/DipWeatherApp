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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
