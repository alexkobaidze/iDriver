//
//  ViewController.swift
//  iDriver
//
//  Created by Alex on 6/7/21.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()

        
        
    }

    
    // MARK:-Hide Navigationbar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    // MARK:- Lottie
    func lottieAnimation() {
        let animationView = AnimationView(name: "57097-car-animation")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 700)
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
          [weak self] in
            let storyboard = UIStoryboard(name: "LogInScreen", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LogInScreenViewController") as! LogInScreenViewController
            self?.navigationController?.pushViewController(vc,animated: true)
    }

    
}
    

}
