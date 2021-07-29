//
//  AutoServiceCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 13.06.21.
//

import UIKit

class AutoServiceCell: UITableViewCell {

    
    internal let autoServicesImage: [String] = []
    internal let autoServiceLabel: [String] = []
    
    @IBOutlet weak var autoServiceView: UIView!
    
    @IBOutlet weak var serviceImage: UIImageView!
    
    @IBOutlet weak var serviceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoServiceView.layer.cornerRadius = 25
        serviceImage.layer.cornerRadius = 25
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
