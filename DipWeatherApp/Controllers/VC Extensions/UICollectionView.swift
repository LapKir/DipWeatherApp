//
//  UICollectionView.swift
//  DipWeatherApp
//
//  Created by Cyril on 1.09.21.
//

import Foundation
import UIKit

extension DailyForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
}
