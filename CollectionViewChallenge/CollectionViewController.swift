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
    let targetDimension: CGFloat = 320                                  // Set up the layout
    let insetAmount: CGFloat = 32                                       // Set up the layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headernib = UINib(nibName: "CollectionViewCell", bundle: nil)
        
        collectionView.register(headernib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        
        var count = 1
        while count < 13 {
            guard let image = UIImage(named: "Image\(count)") else { return }
            images.append(image)
            count += 1
            //Debugging
            print("Loading Image\(count)")
        }
        
    }
  
        // Set up the layout
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("Unable to retrieve layout")}
            layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
            layout.minimumLineSpacing = .greatestFiniteMagnitude
            layout.scrollDirection = .horizontal
            print("Hello Layout")
        }
    
    // Set up the data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("Error")}
        
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Fetch image
        let image = images[indexPath.row]
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }
}
