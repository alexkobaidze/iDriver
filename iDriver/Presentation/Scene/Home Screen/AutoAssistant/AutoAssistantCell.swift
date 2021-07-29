//
//  AutoAssistantCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 15.06.21.
//

import UIKit

class AutoAssistantCell: UITableViewCell {
    
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var autoAssistantImage: UIImageView!
    @IBOutlet weak var autoAssistantName: UILabel!
    @IBOutlet weak var autoAssistantRating: UIImageView!
   
    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        autoAssistantImage.layer.cornerRadius = 25
        cellView.layer.cornerRadius = 25
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
