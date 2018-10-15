//
//  SelectedCellModel.swift
//  CollectionViewChallenge
//
//  Created by Nikita Thomas on 10/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import UIKit

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
