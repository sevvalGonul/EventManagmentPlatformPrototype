//
//  EventsRepository.swift
//  Prototype
//
//  Created by Şevval Gönül 
//

import Foundation
import RxSwift
import FirebaseFirestore

class EventsRepository {
    var eventList = BehaviorSubject<[Event]>(value: [Event]())
    var collectionEvents = Firestore.firestore().collection("Events")
    
    func createEvent(title: String, category: String, date: String, time: String, location: String, price: Int, imageUrl: String, description: String) {
        
        let newEvent : [String : Any] = ["id": "", "title": title, "category": category, "date": date, "time": time, "location": location, "price": price, "imageurl": imageUrl, "description": description]
        
        collectionEvents.document().setData(newEvent)
        
        
    }
    
    func loadEvents() {
        // Realtime database, listening
        collectionEvents.addSnapshotListener { snapshot, error in
            var liste = [Event]()
            if let documents = snapshot?.documents {
                for document in documents {  // document - each row
                    let data = document.data()  // Dictionary
                    
                    let event_id = document.documentID
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let date = data["date"] as? String ?? ""
                    let time = data["time"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let price = data["price"] as? Int ?? 0
                    let image = data["imageurl"] as? String ?? ""
                    
                    let event = Event(id: event_id, title: title, description: description, category: category, date: date, time: time, location: location, price: price, photo: image)
                    
                    liste.append(event)
                    
                }
            }
            self.eventList.onNext(liste)  // Trigerring
        }
    }

}
