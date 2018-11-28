import UIKit

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for counter in 1 ... 12 {
            let name = "image\(counter)"
            guard let image = UIImage(named: name) else { return }
            images.append(image)
            
        }
       
     }
    
}
