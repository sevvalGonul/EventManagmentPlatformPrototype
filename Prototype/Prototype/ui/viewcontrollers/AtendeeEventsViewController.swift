//
//  AtendeeEventsViewController.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import UIKit
import Kingfisher

class AtendeeEventsViewController: UIViewController {
    
    var eventList = [Event]()
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    var viewModel = AttendeeEventsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        _ = viewModel.eventList.subscribe(onNext: {  // Veri değişikliğinin dinlenmesi
            liste in
            self.eventList = liste
            DispatchQueue.main.async {
                // liste güncellendi collection viewa arayüzü güncellemesi iletiliyor
                self.eventsCollectionView.reloadData()
            }
        })
        

        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10  // itemlar arası yatay boşluk
        tasarim.minimumLineSpacing = 10  // dikey boşluk
        
        // 10 + 10 + 10 = 30 bosluk
        //Yatayda iki item olması icin herbir itemın genisligi (ekranGenisligi - bosluk) / 2
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.8)
        
        eventsCollectionView.collectionViewLayout = tasarim
        
    }

}

extension AtendeeEventsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let event = eventList[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCell
        
        //hucre.eventImageView.image = UIImage(named: event.image!)
        if let url = URL(string: event.image!) {
            DispatchQueue.main.async {
                hucre.eventImageView.kf.setImage(with: url)
            }
        }
            
        hucre.priceLabel.text = "\(event.price!) ₺"
        hucre.eventNameLabel.text = event.title!
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
        
        
        return hucre
    }
    
    // didSelect - item'a tıklanma metodu
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = eventList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let event = sender as? Event {
                let destVC = segue.destination as! AttendeeEventDetailsViewController
                destVC.event = event
            }
        }
    }
}
