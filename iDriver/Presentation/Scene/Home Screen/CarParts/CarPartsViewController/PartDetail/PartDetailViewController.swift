//
//  PartDetailViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 24.07.21.
//

import UIKit
import Kingfisher
import MessageUI

class PartDetailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var partList: Part?
    
    @IBOutlet weak var orderButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 25
        guard let part = partList else { return }
        configure(with: part)
        orderButton.layer.cornerRadius = 15

    }
    @IBAction func didTapOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    func configure(with item: Part) {
        carModelLabel.text = item.vehicle
        partNameLabel.text = item.part
        priceLabel.text = item.Price
        let url = URL(string: item.image!)
        imageView.kf.setImage(with: url)
    }
   
    @IBAction func order(_ sender: Any) {
        showMailComposer()
    }
    
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["CarPart@Parts.com"])
        composer.setSubject(" მანქანის ნაწილი")
        composer.setMessageBody("მსურს მსურს შევიძინო მანქანის ნაწილი ", isHTML: false)
        
        present(composer, animated: true)
    }


}
