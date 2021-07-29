//
//  Extension+UITableView.swift
//  Task24-TikoJanikashvili
//
//  Created by Tiko on 02.06.21.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UITableView {
    func registerNib<T: UITableViewCell>(class: T.Type) {
        self.register(T.nib(), forCellReuseIdentifier: T.identifier)
    }
    
    func deque<T: UITableViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nib(), forCellWithReuseIdentifier: T.identifier)
    }
    
    func deque<T: UICollectionViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }

    private enum PillCellSpacing: CGFloat {
        case defaultValue = 10.0
    }
}
