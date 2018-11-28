import UIKit
import Foundation

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for values in 1...12 {
            guard let image = UIImage(named: "Image\(values)") else { fatalError("Unable to retrieve images") }
            images.append(image)
        }
    }
}
