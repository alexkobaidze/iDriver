//
//  RegistrationScreenViewController.swift
//  iDriver
//
//  Created by Alex on 6/8/21.
//

import UIKit
import FirebaseAuth
import Firebase

class RegistrationScreenViewController: UIViewController {
    
    //MARK:- @IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberPlateTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleTextField(nameTextField)
        Utilities.styleTextField(numberPlateTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        self.reggisterObservebles()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func validateFields() -> String? {
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            numberPlateTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "გთხოვთ შეავსოთ ყველა ველი"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // პაროლი არ არის დაცული
            return "გთხოვთ, დარწმუნდეთ, რომ თქვენი პაროლი მინიმუმ 8 სიმბოლოა, ასევე  შეიცავს სპეციალურ სიმბოლოს და ციფრს"
        }
        
        return nil
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
            
            showError(error!)
        }
        else {
            
            
            let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let numberPlate = numberPlateTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("დაფიქსირდა პრობლემა რეგისტრაციის დროს")
                } else {
                    let db = Firestore.firestore()
                    let userId = Auth.auth().currentUser?.uid ?? ""
                    
                    db.collection("users").document(userId).setData([
                        "name":name,
                        "numberPlate": numberPlate,
                        "uid": result?.user.uid ?? ""
                        
                    ], merge: true)
                    self.transitionToHome()
                }
                
            }
            
        }
        
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ifYouHaveRegistered(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "LogInScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LogInScreenViewController") as! LogInScreenViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
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
            if numberPlateTextField.isEditing || passwordTextField.isEditing {
                let keyboardHeight = keyboardSize.height
                view.frame.origin.y = 0 - keyboardHeight
            }
            
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    
    
    
    
    
    
}


//private func updateInfo() {
//       guard let userId = Auth.auth().currentUser?.uid else { return }
//       let newData = db.collection("users").document(userId)
//       //name
//       newData.updateData(["firstName": usernameTextField.text ?? ""])
//       //surname
//       newData.updateData(["surName": userSurname.text ?? ""])
//       //city
//       newData.updateData(["city": userCity.text ?? ""])
//       //sex
//       newData.updateData(["sex": userSex.text ?? ""])
//       //age
//       newData.updateData(["age": userAge.text ?? ""])
//       //mobilePhone
//       newData.updateData(["number": userMobilePhone.text ?? ""])
//       //email
//       newData.updateData(["email": userEmail.text ?? ""])
//       //passowrd
//       if self.newPasswordTextField.text == self.repeatNewPassword.text {
//           guard let user = Auth.auth().currentUser else { return }
//           user.updatePassword(to: repeatNewPassword.text ?? "", completion: nil)
//
//       } else if self.newPasswordTextField.text != self.repeatNewPassword.text {
//           self.view.endEditing(true)
//           alertView.set(title: "ახალი პაროლი და გამოერებული პაროლი\nარ ემთხვევა", dissmissText: "დახურვა")
//           self.setAlert()
//           self.animateIn()
//       }
//   }
