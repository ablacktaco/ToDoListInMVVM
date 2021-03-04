//
//  MainViewModel.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/2/26.
//

import Foundation

protocol ListViewModelDelegate {
    func update(_ mode: UpdateMode)
}

class ListViewModel {
    
    var lists: [ToDoViewModel] {
        didSet {
            // 待修改狀態
            delegate?.update(.add)
        }
    }
    var delegate: ListViewModelDelegate?
    
    init() {
        let data = ToDoList.shared.list
        self.lists = data.map({ ToDoViewModel(model: $0) })
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewModel), name: Notification.Name("ModelDidChanged"), object: nil)
    }
    
    func add() {
        ToDoList.shared.list.append(ToDoModel(title: "安安", isChecked: false))
    }
    
    func changeState(_ index: Int) {
        ToDoList.shared.list[index].isChecked.toggle()
    }
    
    func delete(_ index: Int) {
        ToDoList.shared.list.remove(at: index)
    }
    
    @objc func updateViewModel() {
        let data = ToDoList.shared.list
        self.lists = data.map({ ToDoViewModel(model: $0) })
    }
    
}

enum UpdateMode {
    case add
    case update(Int)
    case delete(Int)
}
