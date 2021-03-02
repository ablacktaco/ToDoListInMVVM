//
//  ToDoList.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/2/26.
//

import Foundation

class ToDoList {
    
    static let shared = ToDoList()
    
    var list: [ToDoModel] {
        get {
            if let data = UserDefaults.standard.object(forKey: "ToDoLists") as? Data {
                if let lists = try? PropertyListDecoder().decode([ToDoModel].self, from: data) {
                    return lists
                }
            }
            return []
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "ToDoList")
        }
    }
    
    var mockList: [ToDoModel] = [
        ToDoModel(title: "MVVM", isChecked: false),
        ToDoModel(title: "API", isChecked: true)
    ]
    
    private init() {}
    
}
