//
//  AutoHelpViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 17.07.21.
//

import UIKit

class AutoHelpViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var autoHelpTableView: UITableView!
    
    let autoHelpImage = ["amwe", "evakuatori", "Driver"]
    let autoHelpTypes = ["Juba.ჯუბა ავტო ამწე", "Juba.ჯუბა ევაკუატორი", "Juba.ჯუბა ფხიზელი მძღოლი"]
    let descriptionLabel = ["კომპანია ჯუბა გთავაზობთ ავტოამწით მომსახურებას, საუკეთესო ფასად საქართველოს მთელ ტერიტორიაზე, რომელსაც შეასრულებენ კვალიფიციური და გამოცდილი მძღოლები", "კომპანია ჯუბა გთავაზობთ ევაკუატორით ყველა სახის ავტომობილის გადაზიდვას, როგორც საქართველოს მთელ ტერიტორიაზე ასევე მის ფარგლებს გარეთ", "კომპანია ჯუბა გთავაზობთ ნასვამი მძღოლის მომსახურების სერვისს. თქვენ მოგემსახურებიან კავალიფიციური და გამოცდილი მძღოლები, რომლებიც თქვენივე ავტომანქანით მიგაბრძანებენ დანიშნულების ადგილზე"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeaderView.layer.cornerRadius = 25
        autoHelpTableView.delegate = self
        autoHelpTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        autoHelpImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutoHelpCell") as! AutoHelpCell
        cell.helpTypeLabel.text = autoHelpTypes[indexPath.row]
        cell.descriptionLabel.text = descriptionLabel[indexPath.row]
        cell.helpTypeLabel.text = autoHelpTypes[indexPath.row]
        cell.autoHelpImage.image = UIImage(named: autoHelpImage[indexPath.row])
       
        return cell
        
    }
    
    
    
    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    


}
