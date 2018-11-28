import UIKit

class CollectionViewController: UICollectionViewController {

    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1 ... 12 {
            guard let image = UIImage(named: "Image\(number)") else { return }
            images.append(image)
        }
    }
}
