//
//  BlogDetailViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 20.07.21.
//

import UIKit

class BlogDetailViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var detailDataLabel: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescLabel: UILabel!
    
    @IBOutlet weak var detailCategoryTitle: UILabel!
    
    var data: Blog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.layer.cornerRadius = 20
        guard let data = data else { return }
        configure(with: data)
     
    }
    
    func configure(with item: Blog) {
        detailTitleLabel.text = item.title
        detailDataLabel.text = item.insert_date
        detailCategoryTitle.text = item.cat_title
        detailDescLabel.text = item.descr
        
    }
   

    @IBAction func didTapOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
