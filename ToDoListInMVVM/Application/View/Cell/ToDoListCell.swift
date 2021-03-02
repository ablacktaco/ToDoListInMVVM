//
//  ToDoListCell.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/3/2.
//

import UIKit
import Reusable

class ToDoListCell: UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        imageView?.tintColor = Color.main
        textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    func setdata(viewModel: ToDoViewModel) {
        imageView?.image = viewModel.image
        textLabel?.text = viewModel.title
    }
    
}
