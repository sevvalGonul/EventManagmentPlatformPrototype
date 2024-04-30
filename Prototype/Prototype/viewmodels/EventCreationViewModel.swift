//
//  EventCreationViewModel.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import Foundation

class EventCreationViewModel {
    let eventRepo = EventsRepository()
    
    func createEvent(title: String, category: String, date: String, time: String, location: String, price: Int, imageUrl: String, description: String) {
        eventRepo.createEvent(title: title, category: category, date: date, time: time, location: location, price: price, imageUrl: imageUrl, description: description)
    }
    
}
