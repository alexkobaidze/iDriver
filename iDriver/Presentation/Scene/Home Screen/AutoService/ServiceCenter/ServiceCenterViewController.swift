//
//  ServiceCenterViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 13.06.21.
//

import UIKit

class ServiceCenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewServiceCenters: UITableView!
    
    let serviceCenterImage = ["Tegeta","Precision","NewAutoMotors"]
    let serviceCenterLabel = ["თეგეტა მოტორსი", "პრესიჟენ ავტო მოტორსი", "ნიუ ავტო მოტორსი"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewServiceCenters.delegate = self
        tableViewServiceCenters.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serviceCenterLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCenterTableViewCell") as! ServiceCenterTableViewCell
        cell.serviceCenterLabel.text = serviceCenterLabel[indexPath.row]
        cell.serviceCenterImage.image = UIImage(named: serviceCenterImage[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Service", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ServiceViewController") as! ServiceViewController
        
        if indexPath.row == 0 { // tegeta
            controller.titleText = "ტეგეტა მოტორსი - სერვის ცენტრი სადაც გაერთიანებულია ყველა სერვისი შენი ავტომობილისთვის. "
            controller.contactInfoText = "ქ. თბილისი, დ. აღმაშენებლის ხეივანი მე-12 კმ, №5სამუშაო საათები:ორშაბათი - პარასკევი: 09:30 - 18:30შაბათი: 09:30 - 18:30კვირა: არასამუშაო დღეTEL: +995 32 226 44 44  (ქოლ ცენტრი)TEL: +995 32 224 44 44  (სათაო ოფისი)"
            controller.headerViewImage = UIImage.init(named: "tegetaTitle")
        } else if indexPath.row == 1 { // Presicion Auto motors
            controller.titleText = "პრესიჟენ ავტო სერვისი არის ამერიკული ფრენჩაიზ კონცეპცია თანამედროვე ტექნოლოგიებით აღჭურვილი ავტომობილის რემონტისა და ტექნიკური მომსახურების უნივერსალური სერვის ცენტრი"
            controller.contactInfoText = "ქ. თბილისი, დ. აღმაშენებლის ხეივანი მე-17 კმ, №5სამუშაო საათები:ორშაბათი - პარასკევი: 09:30 - 18:30შაბათი: 09:30 - 18:30კვირა: არასამუშაო დღეTEL: +995 32 226 44 44  (ქოლ ცენტრი)TEL: +995 32 2 11 11 11   (სათაო ოფისი)"
            controller.headerViewImage = UIImage.init(named: "Precision")
        } else if indexPath.row == 2 { // New Auto Motots
            controller.titleText = "New Auto Motors -ჩვენი კომპანია ერთ სივრცეში აერთიანებს ავტომობილის აღდგენა შეკეთებასთან დაკავშირებულ ყველა სახის მომსახურებას"
            controller.contactInfoText = "ქ. თბილისი, დ. ხოშარაულის 30, სამუშაო საათები:ორშაბათი - პარასკევი: 09:30 - 18:30შაბათი: 09:30 - 18:30კვირა: არასამუშაო დღეTEL: +995 32 226 44 44  (ქოლ ცენტრი)TEL: +995 32 2 11 11 11   (სათაო ოფისი)"
            controller.headerViewImage = UIImage.init(named: "NewAutoMotors")
        }
            
        self.navigationController?.pushViewController(controller, animated: true)

}
    
    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
