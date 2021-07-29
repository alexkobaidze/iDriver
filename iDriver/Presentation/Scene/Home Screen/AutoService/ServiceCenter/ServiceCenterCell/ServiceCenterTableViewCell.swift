//
//  ServiceCenterTableViewCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 13.06.21.
//

import UIKit

class ServiceCenterTableViewCell: UITableViewCell {
    @IBOutlet weak var serviceCenterView: UIView!
    @IBOutlet weak var serviceCenterImage: UIImageView!
    
    @IBOutlet weak var serviceCenterLabel: UILabel!
    
    @IBOutlet weak var headerView : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        headerView.layer.cornerRadius = 25
        serviceCenterView.layer.cornerRadius = 25
        serviceCenterImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}
