//
//  UITableView.swift
//  DipWeatherApp
//
//  Created by Cyril on 31.08.21.
//

import Foundation
import UIKit

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let number = viewModel.forecastModel.value?.data.count else { return 0 }
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell", for: indexPath) as? ForecastTableViewCell else { return UITableViewCell() }
        
        DispatchQueue.main.async {
            let forecast = self.viewModel.forecastModel.value
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d"
            cell.descriptionLabel.text = forecast?.data[indexPath.row].weather.description
            
            if let imageName = forecast?.data[indexPath.row].weather.icon,
               let temperature = forecast?.data[indexPath.row].temperature,
               let dateString = forecast?.data[indexPath.row].date {
                
                cell.conditionImage.image = UIImage(named: imageName)
                cell.temperatureLabel.text = "\(temperature)°C"
                
                if let date = dateFormatter.date(from: dateString) {
                    dateFormatter.dateFormat = "MMM d"
                    cell.dateLabel.text = dateFormatter.string(from: date)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
