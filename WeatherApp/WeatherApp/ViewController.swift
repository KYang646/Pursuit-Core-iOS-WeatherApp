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
    
    var weatherInformation = [PeriodsInformation](){
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

    func getData(){
       
        WeatherAPI.weatherInformation(zipCode: zipCode) { (error, data) in
            if let error = error {
                print("Error: \(error)")
            } else if let weather = data {
                self.weatherInformation = weather.response[0].periods
                print(self.weatherInformation.count)
                self.setCityName()
            }
        }
        
        
    }

    

}

