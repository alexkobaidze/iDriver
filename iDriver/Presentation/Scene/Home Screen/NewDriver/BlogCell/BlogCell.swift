//
//  BlogCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 19.07.21.
//

import UIKit

class BlogCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var navigationController: UINavigationController?
    var data: [Blog] = []
    var didSelectClosure :((_ tableIndex: Int?, _ collectionIndex: Int?) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.registerNib(class: BlogItemCell.self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.dataSource = self
        collectionView.delegate = self    }
    
    func configure(with blogs: [Blog]) {
        data = blogs
        collectionView.reloadData()
    }
}

extension BlogCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(BlogItemCell.self, for: indexPath)
        cell.configure(with: data[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "BlogDetailViewController", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "BlogDetailViewController") as! BlogDetailViewController
        vc.data = data[indexPath.row]
            
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
     
    
  
}

extension BlogCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 170, height: 270)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
}
