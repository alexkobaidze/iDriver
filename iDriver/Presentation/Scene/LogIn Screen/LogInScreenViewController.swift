//
//  LogInScreenViewController.swift
//  iDriver
//
//  Created by Alex on 6/7/21.
//

import UIKit
import FirebaseAuth
import MessageUI
class LogInScreenViewController: UIViewController, MFMailComposeViewControllerDelegate {
//MARK:-IBoutlets
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInObservebles()
        Utilities.styleTextField(emailtextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
        Utilities.styleFilledButton(signUpButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
           view.addGestureRecognizer(tap)

    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func didTapNex(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") 
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    

    @IBAction func logInTapped(_ sender: Any) {
        
        let email = emailtextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
  
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
             
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
                self.navigationController?.pushViewController(vc, animated: true)

            }
        }
    }
        

    
    //MARK:- რეგისტრაციის გვერდზე გადასვლა
    @IBAction func registrationTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrationScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationScreenViewController") as! RegistrationScreenViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    private func logInObservebles() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:  UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name:  UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if emailtextField.isEditing || passwordTextField.isEditing {
                let keyboardHeight = keyboardSize.height
                view.frame.origin.y = 0 - keyboardHeight
            }

        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }

}
extension LogInScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
