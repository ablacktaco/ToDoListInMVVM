//
//  ToDoList.swift
//  ToDoListInMVVM
//
//  Created by 陳姿穎 on 2021/2/26.
//

import Foundation

class ToDoList {
    
    static let shared = ToDoList()
    
    lazy var list: [ToDoModel] = getLocalList() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(list), forKey: "ToDoList")
            NotificationCenter.default.post(name: Notification.Name("ModelDidChanged"), object: nil)
        }
    }
    
    private func getLocalList() -> [ToDoModel] {
        if let data = UserDefaults.standard.object(forKey: "ToDoList") as? Data {
            if let lists = try? PropertyListDecoder().decode([ToDoModel].self, from: data) {
                return lists
            }
        }
        return []
    }
    
    private init() {}
    
}
