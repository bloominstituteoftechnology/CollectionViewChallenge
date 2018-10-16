import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.layer.borderWidth = 10
                self.layer.borderColor = UIColor.yellow.cgColor
            }
            else
            {
                self.layer.borderWidth = 0
            }
        }
    }
    
}
