//
//  CarWashTableViewCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 14.07.21.
//

import UIKit

class CarWashTableViewCell: UITableViewCell {

    internal let carWashServiceImage: [String] = []
    internal let carWashServiceLabel: [String] = []
    
    @IBOutlet weak var carWashServiceView: UIView!
    @IBOutlet weak var washServiceImage: UIImageView!
    @IBOutlet weak var carWashServiceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carWashServiceView.layer.cornerRadius = 25
        washServiceImage.layer.cornerRadius = 25

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
