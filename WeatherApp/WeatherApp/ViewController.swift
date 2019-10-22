//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    private var searchString: String? {
        didSet {
            loadLatLongFromZip()
            self.weatherCollectionView.reloadData()
            
            if let searchString = searchString {
                UserDefaultsWrapper.manager.store(searchString: searchString)
            }
        }
    }
    
    
     private func loadData() {
         let urlStr = WeatherAPIClient.getSearchResultsURLStr(from: latitude, longitude: longitude)
         
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
     
    
    var searchTerm: String? = nil {
        didSet {
            guard let searchTerm = searchTerm else {return}
            guard searchTerm != "" else {return}
            let newURL = /*"http://api.tvmaze.com/search/shows?q=\(searchTerm.lowercased())"*/
            loadData(url: newURL)
            tableView.reloadData()
        }
    }
    
    func zipCode(_ searchTextField: UITextField, textDidChange searchText: String) {
        searchTerm = zipCodeTextField.text
        
    }

    

}

