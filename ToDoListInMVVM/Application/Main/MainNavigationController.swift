//
//  MainNavigationController.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/2/26.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationBar.barTintColor = Color.main
        navigationBar.tintColor = .white
        navigationBar.shadowImage = UIImage()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        navigationBar.titleTextAttributes = attributes
    }
    
}
