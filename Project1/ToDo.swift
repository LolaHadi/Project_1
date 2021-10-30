import Foundation

class ToDo {
    var index: Int
    var title: String
    var description: String
    var deadline: Date?
    var done: Bool = false
    
    init(index: Int, title: String, description: String, deadline: Date?, done: Bool) {
        self.index = index
        self.title = title
        self.description = description
        self.deadline = deadline
        self.done = done
    }
    
    func markAsDone(userInput: Int) {
        UserList.toDoList[userInput].done = true
    }
    
    func markAsNotDone(userInput: Int) {
        UserList.toDoList[userInput].done = true
    }
}
