//
//  StudyDriverCellTableViewCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 22.07.21.
//

import UIKit
import WebKit
class StudyDriverCellTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var videoView: WKWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        getVideo(videoCode: "89rghWSBFgE")
        videoView.layer.cornerRadius = 25
        view.layer.cornerRadius = 25
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func getVideo(videoCode: String){
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        videoView.load(URLRequest(url: url!))
    }
  
    
}

