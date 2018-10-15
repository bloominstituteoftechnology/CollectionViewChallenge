//
//  CollectionViewController.swift
//  CollectionViewChallenge
//
//  Created by Jerrick Warren on 10/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    let reuseIdentifier = "cell"
    var images: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        for i in 1...12 {
            guard let image = UIImage(named: "Image\(i)") else {return}
            images.append(image)
        }
        
      
        
    }
    
    
}
