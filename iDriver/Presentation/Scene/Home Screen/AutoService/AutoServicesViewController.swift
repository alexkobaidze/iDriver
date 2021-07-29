//
//  AutoServicesViewController.swift
//  iDriver
//
//  Created by Alex on 6/10/21.
//

import UIKit

class AutoServicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

let autoServicesImage = ["service_Centers","car_wash","fuel_servicecenter"]
    let autoServiceLabel = ["სერვის ცენტრები", "ავტომობილის სამრეცახოები", "ბენზინ გასამართი სადგურები"]
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableViewServices: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHeader.layer.cornerRadius = 25
        
        tableViewServices.delegate = self
        tableViewServices.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        autoServiceLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutoServiceCell") as! AutoServiceCell
        cell.serviceName.text = autoServiceLabel[indexPath.row]
        cell.serviceImage.image = UIImage(named: autoServicesImage[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if(indexPath.row == 0)// Service Centers
        {
        let storyboard = UIStoryboard(name: "ServiceCenter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ServiceCenterViewController") as! ServiceCenterViewController
        self.navigationController?.pushViewController(controller, animated: true)
       
        } else if indexPath.row == 1 { // Car Wash
            let storyboard = UIStoryboard(name: "CarWashServiceViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "CarWashServiceViewController") as! CarWashServiceViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }else if indexPath.row == 2 { // GasS tations
            let storyboard = UIStoryboard(name: "GasStationViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GasStationViewController") as! GasStationViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
      }
    
    
    
    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    
}

