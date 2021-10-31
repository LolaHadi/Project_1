
import Foundation

class UserList {
    
    var toDoList: [ToDo]
    static var userInput = -1
    
    init(toDoList: [ToDo]) {
        self.toDoList = toDoList
    }
    
    
    static func ViewUserList() {
        var index = -1
        let currentList: [ToDo]
        
        while index != 0 {
            
            if currentList.isEmpty {
                print("Your ToDo List is Empty Right Now!")
                print("1 \tTo Create Your First ToDo")
                print("9 \tTo Go Back To The Main Menu")
                print("0 \tTo End Program")
                
                var userInput = Utils.readInt()
                switch userInput {
                case 1:
                    CreateNewToDo()
                case 9:
                    print("\n")
                    index = 0
                case 0:
                    index = 0
                    mainUserInput = 0
                default:
                    print("Invalid Input!")
                }
                
                for i in currentList {
                    print("\(i.index).\t\(i.title),\t\(i.description),\t\(String(describing: i.deadline)),\t\(i.done ? "Done": "Not Done Yet")")
                    index += 1
                }

                print("\n")
                print("Above is Your List of Tasks")
                print("1 \tTo Do Some Operations On Your List")
                print("2 \tTo Add New ToDo")
                print("9 \tTo Go Back To The Main Menu")
                print("0 \tTo End Program")

        }
                switch Utils.readInt() {
                case 1:
                    ToDo.OperationsOnToDo()
                case 2:
                    CreateNewToDo()
                case 9:
                    break
                default:
                    print("Invalid Input!")
                }
            }
    }
    
    static func CreateNewToDo() {
        
        let currentTodo: ToDo
        print("\n")
        var x = 1
        
        while x == 1 {
            print("Enter Task Title (30 Letters): ", terminator: "")
            
            var currentTitle = currentTodo.title
            currentTitle = Utils.readString()
            
            if currentTitle.count <= 30 {
                currentTodo.title = currentTitle
                x = 0
                break
            } else {
                print("Title Length Shhould Be Less Than 30")
            }
        }
        
        
        x = 1
        while x == 1 {
            print("Enter Description (150 Letters): ", terminator: "")
            let currentDescription = Utils.readString()
            if currentDescription.count <= 150 {
                currentTodo.description = currentDescription
                x = 0
                break
            } else {
                print("Description Length Shhould Be Less Than 350")
            }
        }
        
            print("Enter Deadline in This Format dd-MM-yyyy")
            print("1 \tTo Skip")
//            let currentDate = Date()
            let currentDeadLine = Utils.readInt()
            switch currentDeadLine {
            case 1:
                break
            default:
                currentTodo.title = Utils.readString()
            }
//            while x == 1 {
//                if currentDeadLine > currentDate {
//                    currentTodo.title = Utils.readString()
//                    x = 0
//                    break
//                } else {
//                    print("Deadline is From the Past ")
//                    print("1 \tTo Save Anyway")
//                    if Utils.readInt() == 1 {
//                        currentTodo.deadline = Utils.readString()
//                        x = 0
//                        break
//                    }
//                }
//            }
            
            print("\n")
            print("Your Enterd ToDo is: \t \(currentTodo)")
            print("1 \tTo Save")
            print("2 \tTo Re-enter It")
            print("3 \tTo Cancel")
            
            switch Utils.readInt() {
            case 1:
                toDoList.append(currentTodo)
                ViewUserList()
            case 2:
                CreateNewToDo()
            case 3:
                break
            default:
                print("Invalid Input")
                break
            }
        }
    
    static func DeleteToDo(index: Int) {
        self.toDoList.remove(at: index)
    }
}
