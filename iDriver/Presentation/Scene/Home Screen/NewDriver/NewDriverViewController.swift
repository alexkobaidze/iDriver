//
//  NewDriverViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 19.07.21.
//

import UIKit

class NewDriverViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    private var datasource: NewDriverDataSource!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.configureDataSource()
    }
    
    private func setupLayout() {
        self.tableView.registerNib(class: BlogCell.self)
        self.tableView.registerNib(class: StudyDriverCellTableViewCell.self)
        self.tableView.registerNib(class: CarFeaturesTableViewCell.self)

   
    }
    private func configureDataSource() {
        self.datasource = NewDriverDataSource(with: self.tableView, navigationController: navigationController!)
        datasource.refresh()
    }
    
    @IBAction func didTapOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
