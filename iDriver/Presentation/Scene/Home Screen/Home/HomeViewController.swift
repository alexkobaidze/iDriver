//
//  HomeViewController.swift
//  iDriver
//
//  Created by Alex on 6/9/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelNumberPlate: UILabel!
    @IBOutlet weak var imageViewHome: UIImageView!
    var holderImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUserData()
        fetchUserDataNumberPlate()
    }
    
    
    private func fetchUserData() {
        let db = Firestore.firestore()
        if let userId = Auth.auth().currentUser?.uid {
            db.collection("users").getDocuments { (docSnapshot, error) in
                guard error == nil , let snapShot = docSnapshot else {
                    return
                }
                if let currentUserDoc = snapShot.documents.first(where: { ($0["uid"] as? String) == userId }) {
                    let name = currentUserDoc["name"] as! String
                    self.labelName.text = "გამარჯობა \(name)"
                    
                }
                
            }
        }
    }
    @IBAction func didTapOnAutoServices(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AutoServices", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AutoServicesViewController") as! AutoServicesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapOnAutoAssistant(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AutoAssistant", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AutoAssistantViewController") as! AutoAssistantViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTapOnNav(_ sender: Any) {
      
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func didTapOnHelp(_ sender: Any) {
      
        let storyboard = UIStoryboard(name: "AutoHelpViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AutoHelpViewController") as! AutoHelpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func didTapOnNewDriver(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NewDriverViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewDriverViewController") as! NewDriverViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func didTapOnCarParts(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CarPartsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CarPartsViewController") as! CarPartsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    private func fetchUserDataNumberPlate() {
        let db = Firestore.firestore()
        if let userId = Auth.auth().currentUser?.uid {
            db.collection("users").getDocuments { (docSnapshot, error) in
                guard error == nil , let snapShot = docSnapshot else {
                    return
                }
                if let currentUserDocPlate = snapShot.documents.first(where: { ($0["uid"] as? String) == userId }) {
                    let numberPlate = currentUserDocPlate["numberPlate"] as! String
                    self.labelNumberPlate.text = "მანქანის სანომრე ნიშანი \(numberPlate)"
                    
                }
                
            }
        }
    }
    
    
}
extension ProfileScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
