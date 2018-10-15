import Foundation

class SelectedCell {
    static let shared = SelectedCell()
    weak var delegate: SelectedCellDelegate?
    
    var selected: Int = 0
    func plusSelected() {
        selected += 1
        delegate?.updateTitle()
    }
    
    func lessSelected() {
        selected -= 1
        delegate?.updateTitle()
    }
}

protocol SelectedCellDelegate: class {
    func updateTitle()
}
