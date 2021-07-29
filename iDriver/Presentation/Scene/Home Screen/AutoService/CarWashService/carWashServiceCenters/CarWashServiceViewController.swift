//
//  CarWashServiceViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 14.07.21.
//

import UIKit

class CarWashServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let carWashServicesImage = ["AmericanWash","EcoWash","fuel_servicecenter"]
        let carWashServicesLabel = ["AmericanWash", "EcoWash"]
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableViewCarWashServices: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewHeader.layer.cornerRadius = 25
    
        tableViewCarWashServices.delegate = self
        tableViewCarWashServices.dataSource = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carWashServicesLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarWashTableViewCell") as! CarWashTableViewCell
        cell.carWashServiceName.text = carWashServicesLabel[indexPath.row]
        cell.washServiceImage.image = UIImage(named: carWashServicesImage[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailCarWashViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailCarWashViewController") as! DetailCarWashViewController
        
        if indexPath.row == 0 { // tegeta
            controller.washTitle = "ავტოსამრეცხაო “MR CAR WASH” კონვეირული სისტემის მეშვეობით გთავაზობთ უმაღლესი ხარისხის მომსახურეობას უმოკლეს დროში."
            controller.washContact = "ქ. თბილისი, დ. აღმაშენებლის ხეივანი მე-12 კმ, №5სამუშაო საათები:ორშაბათი - პარასკევი: 09:30 - 18:30შაბათი: 09:30 - 18:30კვირა: არასამუშაო დღეTEL: +995 32 226 22 222 (ქოლ ცენტრი)TEL: +995 11 111 111 (სათაო ოფისი)"
            controller.carWashViewImage = UIImage.init(named: "NewAutoMotors")
        } else if indexPath.row == 1 { // Presicion Auto motors
            controller.washTitle = "ავტოსამრეცხაო „ეკო ვოში“ გელით ყოველდღე,კომპანია „ეკო ვოში“ ორიენტირებულია მომხმარებლის კმაყოფილებაზე და გთავაზობთ მაღალ ხარისხს მისაღებ ფასად. "
            controller.washContact = "ქ. თბილისი, დ. აღმაშენებლის ხეივანი მე-17 კმ, №5სამუშაო საათები:ორშაბათი - პარასკევი: 09:30 - 18:30შაბათი: 09:30 - 18:30კვირა: არასამუშაო დღეTEL: +995 32 226 44 44  (ქოლ ცენტრი)TEL: +995 32 2 11 11 11   (სათაო ოფისი)"
            controller.carWashViewImage = UIImage.init(named: "EcoWash")
        }
            
        self.navigationController?.pushViewController(controller, animated: true)

}

    @IBAction func didTapOnBack(_ sender: Any) {
        
    navigationController?.popViewController(animated: true)
        
    }
}
