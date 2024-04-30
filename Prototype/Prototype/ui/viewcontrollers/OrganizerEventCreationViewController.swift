//
//  OrganizerEventCreationViewController.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import UIKit

class OrganizerEventCreationViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var eventTitleTf: UITextField!
    @IBOutlet weak var eventCategoryTf: UITextField!
    @IBOutlet weak var eventDateTf: UITextField!
    @IBOutlet weak var eventTimeTf: UITextField!
    @IBOutlet weak var eventLocationTf: UITextField!
    @IBOutlet weak var eventPriceTf: UITextField!
    @IBOutlet weak var imageUrlTf: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var viewModel = EventCreationViewModel()
    
    let placeholderText = "Please enter event's description."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.delegate = self
        self.descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        self.descriptionTextView.layer.borderWidth = 1
        descriptionTextView.text = placeholderText
        descriptionTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func buttonDesignSeatingChartClicked(_ sender: Any) {
        showAlert(message: "Not implemented yet.")
    }
    
    
    @IBAction func buttonCreateEventClicked(_ sender: Any) {
        let requiredFields: [UITextField] = [eventTitleTf, eventCategoryTf, eventDateTf, eventTimeTf, eventLocationTf, eventPriceTf, imageUrlTf]

        // Boş alanları kontrol et
        for field in requiredFields {
            guard let text = field.text, !text.isEmpty else {
                // Eğer bir alan boşsa, kullanıcıya uyarı ver ve işlemi sonlandır
                showAlert(message: "Please fill in all fields.")
                return
            }
        }

        // Açıklama alanını kontrol et
        guard let descriptionText = descriptionTextView.text, !descriptionText.isEmpty else {
            showAlert(message: "Please fill in event's description")
            return
        }

        // Tüm alanlar dolu, ViewModel üzerinden createEvent fonksiyonunu çağır
        if let priceText = eventPriceTf.text, let price = Int(priceText) {
            // Eğer dönüştürme başarılı olduysa, price değişkeni kullanılabilir
            viewModel.createEvent(title: eventTitleTf.text!,
                                   category: eventCategoryTf.text!,
                                   date: eventDateTf.text!,
                                   time: eventTimeTf.text!,
                                   location: eventLocationTf.text!,
                                   price: price,
                                   imageUrl: imageUrlTf.text!,
                                   description: descriptionText)
            showAlert(message: "The event has been created successfully.")
        } else {
            // Eğer dönüştürme başarısız olduysa, kullanıcıya bir hata mesajı gösterilebilir
            showAlert(message: "Please enter a valid price. Price cannot contain letters.")
        }

        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
