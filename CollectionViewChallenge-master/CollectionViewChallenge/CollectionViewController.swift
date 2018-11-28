import UIKit

class CollectionViewController: UICollectionViewController {
    
    var paintings: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for counter in 1 ... 12 {
            let paintingImageName = "Image\(counter)"
            guard let image = UIImage(named: paintingImageName) else { fatalError("Could not provide any images from the assets folder.") }
                paintings.append(image)
            }
    }
    
}
