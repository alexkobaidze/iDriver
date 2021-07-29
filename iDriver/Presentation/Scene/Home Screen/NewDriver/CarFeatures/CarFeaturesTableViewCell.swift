//
//  CarFeaturesTableViewCell.swift
//  iDriver
//
//  Created by Ako Kobaidze on 23.07.21.
//

import UIKit
import WebKit

class CarFeaturesTableViewCell: UITableViewCell {
    @IBOutlet weak var videoView: WKWebView!
    
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        getVideo(videoCode: "BjX79GsALd8")
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
