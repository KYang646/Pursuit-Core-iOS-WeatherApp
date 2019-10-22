//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var locationName = ""
    private var latitude = ""
    private var longitude = ""
    
    
    var city = ""
    var zipcode = "11368" {
        didSet {
            DispatchQueue.main.async {
            //    self.getData()
                self.daCollectionView.reloadData()
            }
        }
    }
    
    var weatherInformation = [WeatherResults](){
        didSet {
            DispatchQueue.main.async {
                self.daCollectionView.reloadData()
            }
        }
    }
    public var isZipcode = true
    
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var daCollectionView: UICollectionView!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func loadLatLongFromZip() {
        ZipCodeHelper.getLatLong(fromZipCode: searchString ?? "") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.latitude = String(data.lat)
                    self.longitude = String(data.long)
                    self.locationName = String(data.name)
                    
                    self.loadData()
                    self.updateLocationLabel()
                }
            }
        }
    }
    
    private func updateLocationLabel() {
           welcomeLabel.text = "Weather Forecast for \(locationName)"
       }

    private var searchString: String? {
        didSet {
            loadLatLongFromZip()
            self.daCollectionView.reloadData()
            
            if let searchString = searchString {
                UserDefaultsWrapper.manager.store(searchString: searchString)
            }
        }
    }
    
    
     private func loadData() {
         let urlStr = WeatherAPIClient.getSearchResultsURLStr(from: latitude, longitude)
         
         WeatherAPIClient.manager.getWeather(urlStr: urlStr) { (result) in
             DispatchQueue.main.async {
                 switch result {
                 case .failure(let error):
                     print(error)
                 case .success(let data):
                     self.allWeather = data
                 }
             }
         }
     }
     
    
//     private var searchString: String? {
//           didSet {
//               loadLatLongFromZip()
//               self.daCollectionView.reloadData()
//               
//               if let searchString = searchString {
//                   UserDefaultsWrapper.manager.store(searchString: searchString)
//               }
//           }
//       }
    
    func zipCode(_ searchTextField: UITextField, textDidChange searchText: String) {
        searchString = zipCodeTextField.text
        
    }

    

}

