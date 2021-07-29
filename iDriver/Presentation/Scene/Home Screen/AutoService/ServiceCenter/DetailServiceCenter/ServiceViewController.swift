//
//  TegetaServiceViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 13.06.21.
//

import UIKit
import MessageUI

class ServiceViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var reservButton: UIButton!
    @IBOutlet weak var reservView: UIView!
    @IBOutlet weak var serviceTitle: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var serviceTypeTextField: UITextField!
    
    var titleText = ""
    var contactInfoText = ""
    var headerViewImage = UIImage.init(named: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        self.setUpUI()
    }
    
    private func setUpUI() {
        titleLabel.text = titleText
        contactLabel.text = contactInfoText
        serviceTitle.image = headerViewImage
        reservView.layer.cornerRadius = 25
        headerView.layer.cornerRadius = 25
        serviceTitle.layer.cornerRadius = 25
        reservButton.layer.cornerRadius = 25
        Utilities.styleTextField(serviceTypeTextField)
       
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    class SAButton: UIButton {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupButton()
        }
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupButton()
        }

        private func setupButton() {
            setTitleColor(.white, for: .normal)
            backgroundColor     = UIColor(red: 255/255, green: 5/255, blue: 41/255, alpha: 1.0)
            titleLabel?.font    = .boldSystemFont(ofSize: 20)
            layer.cornerRadius  = frame.size.height / 2
        }
    }
    @IBAction func emailButtonTapped(_ sender: SAButton) {
        guard let serviceTypeText = serviceTypeTextField.text else {
            return
        }
        UserDefaults.standard.setValue(serviceTypeText, forKey: "serviceTypeText")
        showMailComposer()
    }

    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["ServiceCenter@ServiceGeorgia.com"])
        composer.setSubject("ჯავშანი დიაგნოსტიკის სერვისზე")
        composer.setMessageBody("მსურს დავჯავშნო ვიზიტი, გთხოვთ დამიკავშირდეთ და შევათანხმოთ ვიზიტის დრო ", isHTML: false)
        
        present(composer, animated: true)
    }
    private func reggisterObservebles() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:  UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name:  UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if serviceTypeTextField.isEditing  {
                let keyboardHeight = keyboardSize.height
                view.frame.origin.y = 0 - keyboardHeight
            }

        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }   
}
