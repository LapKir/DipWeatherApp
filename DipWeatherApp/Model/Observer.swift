//
//  Observer.swift
//  DipWeatherApp
//
//  Created by Cyril on 1.09.21.
//

import Foundation

final class Observer<T> {
    
    private var listener: ((T) -> ())?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ handler: @escaping((T) -> ())) {
        listener = handler
    }
}
