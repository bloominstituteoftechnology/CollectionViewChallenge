import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewFlowLayout {

    var images: [UIImage] = []
    
    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1 ... 12 {
            guard let image = UIImage(named: "Image\(number)") else { return }
            images.append(image)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //retrieve collectionview and casting it
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("unable to retrieve layout")}
        
        //set layout sectionInset using insetAmount
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        
        //set layout minimumLineSpacing to .greatestFiniteMagnitude
        layout.minimumLineSpacing = .greatestFiniteMagnitude
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("Unable to dequeue proper cell")}
        
        cell.paintingView.image = images[indexPath.row]
        return cell
    }
    
    //allows for flexible sizing given in instruction
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let image = images[indexPath.row]
        
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }
    
}

