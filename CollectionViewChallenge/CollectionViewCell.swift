import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
//    var navigationController: UINavigationController!
    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                self.layer.borderWidth = 1
                self.layer.borderColor = UIColor.yellow.cgColor
                
            }
            else {
                self.layer.borderWidth = 0
                
            }
        }
    }
}
