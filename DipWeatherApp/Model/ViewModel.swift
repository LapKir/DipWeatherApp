//
//  ViewModel.swift
//  DipWeatherApp
//
//  Created by Cyril on 1.09.21.
//

import Foundation

class ViewModel {
    
    private let netWorking = Networking()
    
    let forecastModel: Observer<ForecastModel?> = Observer(nil)
    
    func fetchForecast(url: String) {
        netWorking.fetchForecast(url: url) { result in
            switch result {
            case .success(let forecast):
                self.forecastModel.value = forecast
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
