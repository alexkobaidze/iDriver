//
//  DetailCarWashViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 14.07.21.
//

import UIKit

class DetailCarWashViewController: UIViewController {

    @IBOutlet weak var carWashDetailView: UIView!
    @IBOutlet weak var carWashDetailImage: UIImageView!

    @IBOutlet weak var carWashDetaillabel: UILabel!
    @IBOutlet weak var carWashContactLabel: UILabel!
    var washTitle = ""
    var washContact = ""
    var carWashViewImage = UIImage.init(named: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        carWashDetailView.layer.cornerRadius = 25
        carWashDetailImage.layer.cornerRadius = 25

    }
    private func setUpUI() {
        carWashDetaillabel.text = washTitle
        carWashDetaillabel.text = washContact
        carWashDetailImage.image = carWashViewImage
    }

    @IBAction func didTapOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
