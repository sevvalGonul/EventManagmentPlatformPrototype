//
//  PaymentViewController.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import UIKit

class PaymentViewController: UIViewController {
    
    
    @IBOutlet weak var cardNumberTf: UITextField!
    @IBOutlet weak var cvcTf: UITextField!
    @IBOutlet weak var cardOwnerNameTf: UITextField!
    @IBOutlet weak var expirationMonthTf: UITextField!
    @IBOutlet weak var expirationYearTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func buttonPurchaseClicked(_ sender: Any) {
        
        if isValidCardNumber(), isValidCVC(), isValidExpirationMonth(), areAllFieldsFilled() {
            // Eğer tüm kısıtlamalar sağlanıyorsa segue saglanır
            performSegue(withIdentifier: "toQr", sender: nil)
        }
    }
    
    
    func isValidCardNumber() -> Bool {
        guard let cardNumber = cardNumberTf.text, cardNumber.count == 16, cardNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            showAlert(message: "You entered an invalid card number. The card number must consist of 16 digits. Please try again.")
            return false
        }
        return true
    }

    func isValidCVC() -> Bool {
        guard let cvc = cvcTf.text, cvc.count == 3, cvc.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            showAlert(message: "You entered an invalid CVC. CVC is the last 3 digits of the number on the back of your card. Please try again.")
            return false
        }
        return true
    }

    func isValidExpirationMonth() -> Bool {
        guard let monthString = expirationMonthTf.text, let month = Int(monthString), (1...12).contains(month) else {
            showAlert(message: "You entered an invalid expiration month for the card. The month number must be a value between 1-12. Please try again.")
            return false
        }
        return true
    }


    func areAllFieldsFilled() -> Bool {
        for textField in [cardNumberTf, cvcTf, expirationMonthTf, expirationYearTf, emailTf] {
            guard let text = textField?.text, !text.isEmpty else {
                showAlert(message: "Please fill in all fields.")
                return false
            }
        }
        return true
    }

    // Hata mesajı gösteren yardımcı fonksiyon
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    

}
