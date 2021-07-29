//
//  BlogItemCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 19.07.21.
//

import UIKit

class BlogItemCell: UICollectionViewCell {

    @IBOutlet weak var blogImage: UIImageView!
    
    @IBOutlet weak var blogTitle: UILabel!
    
    @IBOutlet weak var blogDate: UILabel!
    
    @IBOutlet weak var blogView: UIView!
    
    @IBOutlet weak var category: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.blogImage.layer.cornerRadius = 20
        self.blogView.layer.cornerRadius = 20
    }

    func configure(with item: Blog) {
        blogTitle.text = item.title
        blogDate.text = item.insert_date
        category.text = item.cat_title
        
    }
}
