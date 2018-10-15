//
//  CollectionViewController.swift
//  CollectionViewChallenge
//
//  Created by Yvette Zhukovsky on 10/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//
import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIndetifier = "cell"
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIndetifier)
        
        for i in 1...12 {
            let image: String = "Image\(i)"
            guard UIImage(named: image) != nil else {return}
            let painting = UIImage(named: image)
            images.append(painting!)
        }
        
        
    }
    
    let targetDimension: CGFloat = 320
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve a layout")
        }
        
        let insetAmount: CGFloat = 32
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
        
        
        
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndetifier, for: indexPath) as? CollectionViewCell else {
            
            fatalError("Inconsistent view state")
        }
        
        cell.imageVIew.image = self.images[indexPath.row]
        
        
        cell.isSelected = true
        
        
        //cell.backgroundColor = UIColor.yellow.cgColor
        cell.layer.borderColor = UIColor.yellow.cgColor
        cell.layer.borderWidth = 1
        
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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

