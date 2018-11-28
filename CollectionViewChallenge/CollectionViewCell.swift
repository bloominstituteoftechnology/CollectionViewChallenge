import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // Static property that can be accessed throughout the class without instantiating a class instance
    static let reuseIdentifier = "cell"
    
    @IBOutlet weak var imageView: UIImageView!
}
