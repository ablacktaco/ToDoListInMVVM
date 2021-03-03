//
//  MainCellViewModel.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/3/2.
//

import UIKit

class ToDoViewModel {
    
    let image: UIImage
    let title: String
    
    init(model: ToDoModel) {
        self.title = model.title
        self.image = UIImage(systemName: model.isChecked ? "checkmark.square.fill" : "square") ?? UIImage()
    }
    
}
