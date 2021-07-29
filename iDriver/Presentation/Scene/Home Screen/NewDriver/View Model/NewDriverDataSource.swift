//
//  NewDriverDataSource.swift
//  iDriver
//
//  Created by Ako Kobaidze on 19.07.21.
//

import Foundation
import UIKit

class NewDriverDataSource: NSObject, UITableViewDataSource {
    
    // MARK: Private Properties
    private var tableView: UITableView!
    private var network = NetworkManager()
    private var navigationController: UINavigationController!
    private var blogs: [Blog] = []
    
    init(with tableView: UITableView,navigationController: UINavigationController ) {
        self.navigationController = navigationController
        
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
    }
    
    func refresh() {
        network.fetchBlog(url: Endpoints.blog, completion: { result in
            switch result {
            case .success(let blogs):
                self.blogs = blogs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.deque(BlogCell.self, for: indexPath)
            if !blogs.isEmpty {
                cell.configure(with: blogs)
            }
            cell.navigationController = navigationController
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.deque(StudyDriverCellTableViewCell.self, for: indexPath)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.deque(CarFeaturesTableViewCell.self, for: indexPath)
            return cell
        }

        let cell = UITableViewCell()
        return cell
    }
}
