//
//  CollectionViewCoontroller.swift
//  CollectionViewChallenge
//
//  Created by Ivan Caldwell on 11/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    var targetDimension: CGFloat = 320
    var insetAmount: CGFloat = 32
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        while count < 12 {
            guard let image = UIImage(named: "Image\(count)") else { return }
            images.append(image)
            count += 1
        }
    }
        
        // I'm not sure how I'm suppose to conform the collection view to
        // UICollectionViewDelegateFlowLayout, is that at the top of the class?
        // is it in the class body? Does it make a difference?
        // self.collectionView.delegate = self
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
                fatalError("Unable to retrieve layout")}
            layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
            layout.minimumLineSpacing = .greatestFiniteMagnitude
            layout.scrollDirection = .horizontal
            
        }
    
}
