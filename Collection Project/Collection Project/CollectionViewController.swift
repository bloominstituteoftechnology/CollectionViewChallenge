import UIKit

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for counter in 1...12 {
            let imageName = "image\(counter)"
            if let image = UIImage(named: imageName) {
            images.append(image)
            }
        }
    }
    
    
    
}
