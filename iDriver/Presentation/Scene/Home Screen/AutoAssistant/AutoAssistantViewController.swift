//
//  AutoAssistantViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 15.06.21.
//

import UIKit

class AutoAssistantViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tableViewAutoAssistant: UITableView!
    
    
    let autoAssistantImage = ["daviti", "giorgi", "nodari", "tornike"]
    let autoAssistantName = ["დავითი", "გიორგი", "ნოდარი", "თორნიკე"]
    let autoAssistantRating = ["rating5", "rating2", "rating3.5", "rating1.5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.layer.cornerRadius = 25
        tableViewAutoAssistant.delegate = self
        tableViewAutoAssistant.dataSource = self
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        autoAssistantName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutoAssistantCell") as! AutoAssistantCell
        cell.autoAssistantName.text = autoAssistantName[indexPath.row]
        cell.autoAssistantImage.image = UIImage(named: autoAssistantImage[indexPath.row])
        cell.autoAssistantRating.image = UIImage(named: autoAssistantRating[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Davit", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DavitViewController") as! DavitViewController
        
        if indexPath.row == 0 {
            controller.nameText = "სახელი:დავით "
            controller.surNameText = "გვარი:ბერიძე"
            controller.mailText = "მეილი:autoassistant.@gmail.com"
            controller.mobileText = "ტელეფონი: 555 11 11 11 "
            controller.headerViewImage = UIImage.init(named: "daviti")
        } else if indexPath.row == 1 {
            controller.nameText = "სახელი:გიორგი "
            controller.surNameText = "გვარი:დავითაშვილი"
            controller.mailText = "მეილი:autoassistant.giorgi@gmail.com"
            controller.mobileText = "ტელეფონი: 555 56 11 33 "
            controller.headerViewImage = UIImage.init(named: "giorgi")
        } else if indexPath.row == 2 {
            controller.nameText = "სახელი:ნოდარი "
            controller.surNameText = "გვარი:გიორგაძე"
            controller.mailText = "მეილი:autoassistant.nodari@gmail.com"
            controller.mobileText = "ტელეფონი: 555 44 11 32 "
            controller.headerViewImage = UIImage.init(named: "nodari")
        } else if indexPath.row == 3 {
            controller.nameText = "სახელი:თორნიკე "
            controller.surNameText = "გვარი:მაისურაძე"
            controller.mailText = "მეილი:autoassistant.tornike@gmail.com"
            controller.mobileText = "ტელეფონი: 555 11 12 78 "
            controller.headerViewImage = UIImage.init(named: "tornike")
        }
            
        self.navigationController?.pushViewController(controller, animated: true)

}
    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
}
