//
//  ToDoListCell.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/3/2.
//

import UIKit
import Reusable

class ToDoListCell: UITableViewCell, Reusable {
    
    private let checkedStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Color.main
        imageView.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(24)
        }
        return imageView
    }()
    
    private lazy var toDoTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = Color.title
        textField.font = UIFont.preferredFont(forTextStyle: .body)
        textField.delegate = self
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.selectionStyle = .none
        let stackView = UIStackView(arrangedSubviews: [checkedStateImageView, toDoTextField])
        stackView.spacing = 16
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.leading.equalTo(16)
        }
    }
    
    func setdata(viewModel: ToDoViewModel) {
        checkedStateImageView.image = viewModel.image
        toDoTextField.text = viewModel.title
    }
    
}

extension ToDoListCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
