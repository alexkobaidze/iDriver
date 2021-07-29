//
//  AutoHelpCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 17.07.21.
//

import UIKit

class AutoHelpCell: UITableViewCell {

    @IBOutlet weak var helpTypeLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var autoHelpImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 25
        autoHelpImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
