//
//  ProfileScreenViewController.swift
//  iDriver
//
//  Created by Alex on 6/9/21.
//

import UIKit
import Firebase

class ProfileScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    @IBOutlet weak var imagePicker: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var helloNameLabel: UITextView!
    @IBOutlet weak var nameLabel: UITextView!
    
    @IBOutlet weak var profileView: UITextView!
    
    @IBOutlet weak var numberPlate: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var numberPlateTextField: UITextField!

    @IBOutlet weak var saveButton: UIButton!
  


    

    private var db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2
    
        super.viewDidLoad()
        
        fetchUserDataName()
        imagePicker.layer.cornerRadius = 12
        saveButton.layer.cornerRadius = 25
        profileView.layer.cornerRadius = 25
        Utilities.styleTextField(nameTextField)
        Utilities.styleTextField(numberPlateTextField)
        Utilities.styleFilledButton(saveButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
           view.addGestureRecognizer(tap)
    }
    
    
    
    
    //MARK:- პროფილის ფოტოს შეცვლა

    @IBAction func imagePicker(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = sender.bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - კამერის გახსნა
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            let imagePicker = UIImagePickerController()

             imagePicker.delegate = self
             imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = true

                present(imagePicker, animated: true, completion: nil)
            
        }
        else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Choose image from camera roll
    
    func openGallary(){

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){

            let imagePicker = UIImagePickerController()

                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true

                present(imagePicker, animated: true, completion: nil)
            }
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.image = image

            }

        }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func updateUserData() {
        guard let nameTextFieldText = nameTextField.text else { return }
        guard let numberPlateTextFieldText = numberPlateTextField.text else { return }
        
        if nameTextFieldText.isEmpty == true || numberPlateTextFieldText.isEmpty == true {
            self.showAlert(message: "გთხოვთ შეავსოთ ყველა ველი")
        } else  {
            guard let userId = Auth.auth().currentUser?.uid else { return }
            let newData = db.collection("users").document(userId)
            //name
            newData.updateData(["name": nameTextField.text ?? ""])
            // mail update
            newData.updateData(["numberPlate": numberPlateTextField.text ?? ""])
            self.showAlert(message: "გილოცავთ თქვენ წარმატებით განაახლეთ ინფორმაცია")
        }

    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        updateUserData()
    }
    

    private func fetchUserDataName() {
        let db = Firestore.firestore()
       if let userId = Auth.auth().currentUser?.uid {
        db.collection("users").getDocuments { (docSnapshot, error) in
               guard error == nil , let snapShot = docSnapshot else {
                   return
               }
                if let currentUserDoc = snapShot.documents.first(where: { ($0["uid"] as? String) == userId }) {
                   let nameGreeting = currentUserDoc["name"] as! String
                   self.helloNameLabel.text = "\(nameGreeting) თქვენ იმყოფებით პირად გვერდზე"
                    let numberPlate = currentUserDoc["numberPlate"] as! String
                    self.numberPlate.text = " თქვენი მანქანის ნომერია: \(numberPlate)"

               }

           }
       }

}
    
    
    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
            if nameTextField.isEditing || numberPlateTextField.isEditing {
                let keyboardHeight = keyboardSize.height
                view.frame.origin.y = 0 - keyboardHeight
            }

        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }

}

extension UIViewController {
  func showAlert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "დახურვა", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
