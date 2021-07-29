//
//  DavitViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 15.06.21.
//

import UIKit
import MessageUI
class DavitViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var topView: UIView!
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var callDavit: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var mobeileLabel: UILabel!
    
    var nameText = ""
    var surNameText = ""
    var mailText = ""
    var mobileText = ""
    var headerViewImage = UIImage.init(named: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 25
        textView.layer.cornerRadius = 25
        callDavit.layer.cornerRadius = 20
        topView.layer.cornerRadius = 20
        setUpUI()
    }
    private func setUpUI() {
        nameLabel.text = nameText
        surnameLabel.text = surNameText
        mailLabel.text = mailText
        mobeileLabel.text = mobileText
        imageView.image = headerViewImage
    }

    @IBAction func callDavit(_ sender: Any) {
   
              showMailComposer()
    }
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["auto_assiistant@Autoassistant.com"])
        composer.setSubject("ავტო ასისტენტის სერვისი")
        composer.setMessageBody("მსურს  ჩემს მანქანას შეუცვალოთ ხუნდები და მატორი ზეთი", isHTML: false)
        
        present(composer, animated: true)
    }
    
    
    
    
    
    

    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

