//
//  CollectionViewController.swift
//  CollectionViewChallenge
//
//  Created by Stuart on 11/28/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let reuseIdentifier = "cell"
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        for number in 1...12 {
            guard let image = UIImage(named: "Image\(number)") else { return }
            images.append(image)
        }
    }
}
