import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []

    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(imageNib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        for counter in 1...12 {
            let imageName = "Image\(counter)"
            if let image = UIImage(named: imageName) {
                images.append(image)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount) fu
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
            else { fatalError("Unable to dequeue proper cell") }
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
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
    
    
    
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
//            else { fatalError("Unable to dequeue proper cell") }
//        let image = images
//        cell.imageView.image =
//
//
//        return cell



//func colorFor(indexPath: IndexPath) -> UIColor {
//    let key = sectionNameFor(indexPath: indexPath)
//    let items = model[key] ?? []
//    let name = items[indexPath.row]
//    return crayonDictionary[name, default: .clear]
//}

//
//func item(at index: Int) -> String {
//    return animals[index]
//
//}

//func imageFor(indexPath: IndexPath) -> String {
//func imageFor(indexPath: IndexPath) -> String {
//    return images[index]
//}
