//
//  PartsTableViewCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 24.07.21.
//

import UIKit
import Kingfisher

class PartsTableViewCell: UITableViewCell {

    @IBOutlet weak var partView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var carModelLabel: UILabel!
    
    @IBOutlet weak var partNameLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 20
        partView.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: Part) {
        priceLabel.text = item.Price
        carModelLabel.text = item.vehicle
        partNameLabel.text = item.part
       
        partView.kf.indicatorType = .activity
        partView.kf.setImage(
            with: URL(string: item.image ?? ""),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }

}
