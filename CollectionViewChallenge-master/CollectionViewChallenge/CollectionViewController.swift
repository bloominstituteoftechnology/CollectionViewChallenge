import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        var nameArray: [UIImage] = []
        for counter in 1 ... 12 {
            let imageName = "image\(counter)"
            guard let image = UIImage(named: imageName) else { fatalError("No images") }
                nameArray.append(image)
            }
    }
    
}
