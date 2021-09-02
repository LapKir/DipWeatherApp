//
//  DailyForecastViewController.swift
//  DipWeatherApp
//
//  Created by Cyril on 1.09.21.
//

import UIKit

final class DailyForecastViewController: UIViewController {
    
    //MARK: - @IBOutlets
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    
    //MARK: - Properties
    
    var forecast: ForecastModel?
    var totalDays = 0
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 10
        
        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
    }
    
    //MARK: - @IBAction
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
