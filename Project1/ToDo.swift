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
    
//    init(index: Int, title: String, description: String, done: Bool) {
//        self.index = index
//        self.title = title
//        self.description = description
//        self.done = done
//    }
    
    
    static func MarkAsDone(index: Int) {
        if !UserList.toDoList[index - 1].done {
            UserList.toDoList[index - 1].done = true
        } else {
            print("This ToDo is Already Marked As Done!\n")
            print("1 \tTo Back To Your ToDo List")
            print("9 \tTo Back To The Main Menu")
            print("0 \tTo Exit and Close The Program")
            print("\n")
            while Utils.readInt() != 0 {
                switch Utils.readInt() {
                case 1:
                    UserList.ViewUserList()
                case 9:
                    break
                default:
                    print("Invalid Input")
                }
            }
        }
        
        UserList.ViewUserList()
        print("\nAbove is Your List of Tasks After Modification")
    }
    
    static func MarkAsNotDone(index: Int) {
        if UserList.toDoList[index - 1].done {
            UserList.toDoList[index - 1].done = false
            print("\(UserList.toDoList[index - 1].done ? "Done" : "Not Done")")
        } else {
            print("This ToDo is Already Marked As Not Done!")
            print("1 \tTo Back To Your ToDo List")
            print("9 \tTo Back To The Main Menu")
            print("0 \tTo Exit and Close The Program")
            print("\n")
            while Utils.readInt() != 0 {
                switch Utils.readInt() {
                case 1:
                    UserList.ViewUserList()
                case 9:
                    break
                default:
                    print("Invalid Input")
                }
            }
        }
        
        UserList.ViewUserList()
        print("\nAbove is Your List of Tasks After Modification")
    }
}
