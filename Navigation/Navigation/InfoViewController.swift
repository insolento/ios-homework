//
//  InfoViewController.swift
//  Navigation
//
//  Created by мак on 09.12.2021.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        let alertButton = UIButton(type: .system)
        alertButton.frame.size.height = 75
        alertButton.frame.size.width = 250
        alertButton.center = view.center
        alertButton.setTitle("Open alert", for: .normal)
        view.addSubview(alertButton)
        alertButton.addTarget(self, action:#selector(self.openAlert), for: .touchUpInside)
    }
    
    @objc func openAlert() {
        let alertWindow = UIAlertController(title: "Name of alert", message: "Message of Alert", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in self.pressedCancel()})
        let moreInfAction = UIAlertAction(title: "More Information!", style: .default, handler: {(alert: UIAlertAction!) in self.pressedMI()})
        alertWindow.addAction(cancelAction)
        alertWindow.addAction(moreInfAction)
        present(alertWindow, animated: true, completion: nil)
        print("Было открыто UIAlertController")
    }
    func pressedMI() {
        print("More Information UIAlert")
    }
    
    func pressedCancel() {
        print("Cancel UIAlert")
    }
}
