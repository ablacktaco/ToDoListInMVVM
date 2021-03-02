//
//  MainViewModel.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/2/26.
//

import Foundation

class ListViewModel {
    
    let lists: [ToDoViewModel]
    
    init() {
//        let data = ToDoList.shared.list
        let data = ToDoList.shared.mockList
        self.lists = data.map({ ToDoViewModel(model: $0) })
    }
    
}

