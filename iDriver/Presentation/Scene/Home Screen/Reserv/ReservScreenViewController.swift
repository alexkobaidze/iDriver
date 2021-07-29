//
//  ReservScreenViewController.swift
//  iDriver
//
//  Created by Alex on 6/9/21.
//

import UIKit

class ReservScreenViewController: UIViewController {

    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!

    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        HeaderView.layer.cornerRadius = 20
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

        guard let item1 = UserDefaults.standard.string(forKey: "serviceTypeText") else { return }

        dataSource.insert(item1, at: 0)

    }
}

extension ReservScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReservCell", for: indexPath) as? ReservCell else {
             return UITableViewCell()
        }
        cell.serviceType.text = dataSource.first
        return cell
    }

}
    

