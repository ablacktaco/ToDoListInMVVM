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
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 0)
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
        let addImage = UIImage(systemName: "plus")
        let addBarButtonItem = UIBarButtonItem(image: addImage, style: .plain, target: self, action: #selector(addToDo))
        navigationItem.rightBarButtonItem = addBarButtonItem
        viewModel.delegate = self
    }
    
    private func setConstraits() {
        view.addSubview(toDoListTableView)
        toDoListTableView.snp.makeConstraints { (maker) in
            maker.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc func addToDo() {
        viewModel.add()
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setdata(viewModel: viewModel.lists[indexPath.row])
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeState(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete: viewModel.delete(indexPath.row)
        default:      break
        }
    }
    
}

extension MainViewController: ListViewModelDelegate {
    
    func update(_ mode: UpdateMode) {
        switch mode {
        case .delete(let index):
            toDoListTableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        default:
            toDoListTableView.reloadData()
        }
    }
    
    
    
    
}
