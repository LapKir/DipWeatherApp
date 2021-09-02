//
//  UICollectionView.swift
//  DipWeatherApp
//
//  Created by Cyril on 1.09.21.
//

import Foundation
import UIKit

extension DailyForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyForecastCollectionViewCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cvRect = collectionView.frame
        return CGSize(width: cvRect.width, height: cvRect.height)
    }
    
}
