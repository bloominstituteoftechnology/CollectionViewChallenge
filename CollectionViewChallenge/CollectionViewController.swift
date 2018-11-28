import UIKit

class CollectionViewController: UICollectionViewController {
    
    // Array that will hold the images
    var images: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 12 images into the image array
        for counter in 1 ... 12 {
            
            // Name the images using string interpolation
            let imageName = "image\(counter)"
            
            // If the image is there, create a UIImage of the named image
            guard let image = UIImage(named: imageName) else { return }
            
            // Add the images to the images array
            images.append(image)
        }
    }
    
    
    
}
