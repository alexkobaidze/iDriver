//
//  CarPartsViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 24.07.21.
//

import UIKit

class CarPartsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headView: UIView!
    
    private var networkManager =  NetworkManager()
    private var partList: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headView.layer.cornerRadius = 25
        tableView.delegate = self
        tableView.dataSource = self
        refresh()
    }
    
    func refresh() {
        networkManager.fetchParts(url: Endpoints.part) { [weak self] result  in
            print(result)
            switch result {
            case .success(let parts):
                self?.partList = parts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        partList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartsTableViewCell") as! PartsTableViewCell
        cell.configure(with: partList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "PartDetailViewController", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "PartDetailViewController") as! PartDetailViewController

        vc.partList = partList[indexPath.row]
            
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    @IBAction func didTapOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    
    
}
