import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewFlowLayout {

    var images: [UIImage] = []
    
    let targetDimensions: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1 ... 12 {
            guard let image = UIImage(named: "Image\(number)") else { return }
            images.append(image)
        }
    }
}
