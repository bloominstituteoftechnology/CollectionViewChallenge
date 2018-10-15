import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, SelectedCellDelegate {
    
    let reuseIdentifier = "cell"
    var images: [UIImage] = []
    var names: [String] = ["The Old Violin","Seascape at Port-en-Bessin, Normandy","Pont Neuf, Paris","The Japanese Footbridge","At the Water's Edge","The Impasto Technique of Rembrandt","Vincent van Gogh", "Green Wheat Fields, Auvers", "The Dancing Couple", "Olive Orchard", "Farmhouse in Provence", "Niagara"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        for numbers in 1...12 {
            guard let image = UIImage(named: ("Image\(numbers)")) else { return }
            images.append(image)
        }
        collectionView?.allowsMultipleSelection = true
        //var randomNumber = Int.random(in: 1...12)
//        self.navigationItem.title = names[randomNumber]
        SelectedCell.shared.delegate = self
        
    }
    
    func updateTitle() {
        let selectedCount = SelectedCell.shared.selected
        self.navigationItem.title = "\(selectedCount)"
    }
    
    let targetDimension: CGFloat = 320
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("Unable to retrieve layout")}
        let insetAmount: CGFloat = 32
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("Inconsistent view state")}
        cell.imageView.image = images[indexPath.row]
        cell.name.text = names[indexPath.row]
        //cell.layer.borderWidth = 1
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.yellow.cgColor
//    }
    
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SelectedCell.shared.plusSelected()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        SelectedCell.shared.lessSelected()
    }
}
