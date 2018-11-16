import UIKit
import Foundation

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    // setup the Layout
    let targetDimension: CGFloat = 320, insetAmount: CGFloat = 32
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
        
        
        
        // retrieve the collection view's collectionViewLayout, cast to UICollectionViewFlowLayout.
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("Unable to retrieve layout")}
        
        //set inset
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        
        //set minimum line spacing
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        
        //set scroll direction to horizontal
        layout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {fatalError("unable to decue the cell")}
        
        cell.imageView.image = images[indexPath.row]
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...17 {
            let imageName = "Image\(i)"
            guard let validImage = UIImage(named: imageName) else {fatalError("no such image")}
            images.append(validImage)
        }
       
    }
    
    
}
