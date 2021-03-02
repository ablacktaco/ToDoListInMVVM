//
//  MainViewController.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/2/26.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    let viewModel = ListViewModel()
    
    private lazy var toDoListTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: ToDoListCell.self)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setConstraits()
    }
    
    private func setup() {
        navigationItem.title = "TO DO"
        view.addSubview(toDoListTableView)
        let addImage = UIImage(named: "plus")
        let addBarButtonItem = UIBarButtonItem(image: addImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    private func setConstraits() {
        toDoListTableView.snp.makeConstraints { (maker) in
            maker.top.leading.bottom.trailing.equalToSuperview()
        }
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setdata(viewModel: viewModel.lists[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    
    
}
