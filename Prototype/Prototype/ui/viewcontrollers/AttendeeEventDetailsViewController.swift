//
//  AttendeeEventDetailsViewController.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import UIKit
import Kingfisher

class AttendeeEventDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var event : Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        if let e = event {
            titleLabel.text = e.title
            //eventImageView.image = UIImage(named: e.image!)
            if let url = URL(string: e.image!) {
                DispatchQueue.main.async {
                    self.eventImageView.kf.setImage(with: url)
                }
            }
            descriptionLabel.text = e.description
            priceLabel.text = "\(e.price!) ₺"
            locationLabel.text = "Konum : \(e.location!)"
            timeLabel.text = "Saat : \(e.time!)"
            dateLabel.text = "Tarih : \(e.date!)"
            categoryLabel.text = "Tür : \(e.category!)"
        }
    }
    
    
    @IBAction func buttonPurchaseClicked(_ sender: Any) {
        
    }
    

}
