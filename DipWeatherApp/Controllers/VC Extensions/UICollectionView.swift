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
        
        return totalDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyForecastCollectionViewCell", for: indexPath) as? DailyForecastCollectionViewCell else { return DailyForecastCollectionViewCell() }
        
        DispatchQueue.main.async {
            let dateFormatter = DateFormatter()
            
            if let sunrise = self.forecast?.data[indexPath.row].sunrise {
                let sunriseTime = Date(timeIntervalSince1970: sunrise)
                dateFormatter.dateFormat = "h:mm a"
                let time = dateFormatter.string(from: sunriseTime)
                cell.sunriseLabel.text = time
            }
            
            if let sunset = self.forecast?.data[indexPath.row].sunset {
                let sunsetTime = Date(timeIntervalSince1970: sunset)
                dateFormatter.dateFormat = "h:mm a"
                let time = dateFormatter.string(from: sunsetTime)
                cell.sunsetLabel.text = time
            }
            
            if let temperature = self.forecast?.data[indexPath.row].temperature,
               let dateString = self.forecast?.data[indexPath.row].date,
               let cityName = self.forecast?.city {
                
                cell.temperatureLabel.text = "\(temperature)°C"
                cell.cityLabel.text = cityName
                
                dateFormatter.dateFormat = "yyyy-MM-dd"
                if let date = dateFormatter.date(from: dateString) {
                    dateFormatter.dateFormat = "MMM d, yyyy"
                    cell.dateLabel.text = dateFormatter.string(from: date)
                }
            }
            
            if let pressure = self.forecast?.data[indexPath.row].pressure {
                let roundPres = round(pressure)
                cell.pressureLabel.text = "Pressure \(Int(roundPres)) mBars"
            }
            
            if let precipitation = self.forecast?.data[indexPath.row].precipitation {
                let roundPrecip = round(precipitation)
                cell.precipitationLabel.text = "Precipitation \(roundPrecip) mm"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cvRect = collectionView.frame
        return CGSize(width: cvRect.width, height: cvRect.height)
    }
}
