import UIKit

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for counter in 1 ... 12 {
            let paintingName = "Image\(counter)"
            // if let image = UIImage(named: paintingName) {
            guard let image = UIImage(named: paintingName) else { fatalError("Could not connect to image assets.") }
            images.append(image)
        }
        // return images ?
    }
    
}
