//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Kimball Yang on 10/17/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    lazy var dateLabel: UILabel = {
        let date = UILabel()
        date.textAlignment = .center
        date.backgroundColor = .clear
        date.textColor = .white
        date.font = UIFont.systemFont(ofSize: 17)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    lazy var daIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var tempLabel: UILabel = {
        let temp = UILabel()
        
        return temp
        
    }()
    
    
    /*
     date
     icon
     high/low
     
     lazy var searchTitle: UILabel = {
         let title = UILabel()
         title.textAlignment = .center
         title.backgroundColor = .clear
         title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         title.numberOfLines = 0
         title.font = UIFont.systemFont(ofSize: 22)
         title.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         title.translatesAutoresizingMaskIntoConstraints = false
         self.addSubview(title)
         return title
     }()
     */
    
    
    

    
    
    
}





