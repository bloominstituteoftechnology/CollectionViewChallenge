//
//  CollectionViewController.swift
//  CollectionViewChallenge
//
//  Created by Benjamin Hakes on 11/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController{
    var images: [UIImage] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        for index in 1...12 {
            guard let image = UIImage(named: "Image\(index)") else {return}
            images.append(image)
        }
    }
    
    
    
    
    
}
