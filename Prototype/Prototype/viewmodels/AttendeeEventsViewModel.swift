//
//  AttendeeEventsViewModel.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import Foundation
import RxSwift

class AttendeeEventsViewModel {
    var eventRepo = EventsRepository()
    var eventList = BehaviorSubject<[Event]>(value: [Event]())
    
    init() {
        eventList = eventRepo.eventList
        loadEvents()
    }
    
    func loadEvents() {
        eventRepo.loadEvents()
    }
}
