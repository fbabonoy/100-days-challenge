//
//  NavigationController.swift
//  project01
//
//  Created by fernando babonoyaba on 6/22/22.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewControllers = [ViewController()]
        // Do any additional setup after loading the view.
    }
}
