//
//  Event.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import Foundation

class Event {
    var id : String?
    var title : String?
    var description : String?
    var category : String?
    var date : String?
    var time : String?
    var location : String?
    var price : Int?
    var image : String?  // Web URL of the image
    
    init(id: String, title: String, description: String, category: String, date: String, time: String, location: String, price: Int, photo: String) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
        self.date = date
        self.time = time
        self.location = location
        self.price = price
        self.image = photo
    }
    
    init() {
        
    }
    
    
}
