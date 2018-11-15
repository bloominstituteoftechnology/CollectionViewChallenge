import UIKit
import Foundation

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load images into array
        for i in 1...12 {
            let imageName = "Image\(i)"
            guard let validImage = UIImage(named: imageName) else {fatalError("no such image")}
            images.append(validImage)
        }
    }
    
    
}
