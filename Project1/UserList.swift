
import Foundation

class UserList {
    
    static var toDoList = [ToDo]()
    
    static func ViewUserList() {
        var index = -1
        
        while Utils.readInt() != 0 {
            
            while UserList.toDoList.isEmpty {
                print("\n\n")
                print("Oops! Your ToDo List is Empty Right Now")
                print("1 \tIf You Want To Create Your First ToDo")
                print("9 \tTo Cancel And Go Back To The Main Menu")
                print("0 \tTo End And Close The Program")
                
                let userInput = Utils.readInt()
                switch userInput {
                case 1:
                    CreateNewToDo()
                case 9:
                    break
                default:
                    print("Invalid Input, Please Type (1), OR Cancel And Go Back To The Main Menu Type (2), OR (0) To End And Close The Program.")
                }
            }
            
            for i in UserList.toDoList {
                print("\(i.index).\t\(i.title),\t\(i.description),\t\(String(describing: i.deadline)),\t\(i.done)")
                index += 1
            }
            
            print("\n^\n")
            print("Above is Your List of Tasks")
            print("1 \tTo Do Some Operations On Your List")
            print("2 \tTo Add New ToDo")
            print("9 \tTo Go Back To The Main Menu")
            print("0 \tTo Close And Exit The Program")
            
            let userInput = Utils.readInt()
            
            switch userInput {
            case 1:
                print("Please Select a ToDo By Typing Its Index Number")
                let userInputIndix = Utils.readInt()
                let currentToDo = UserList.toDoList[userInputIndix - 1]
                
                print("Your Selected ToDo is\(currentToDo), \nNow Choose The Operation You Want To Do From The Following: ")
                print("\n1\t To Mark a ToDo As Done")
                print("2\t To Mark a ToDo As (Not) Done")
                print("3\t To Delete a ToDo")
                print("9\t To Go back to Main Menu")
                print("0\t To Close And Exit The Program")
                print("\n\n")
                
                switch Utils.readInt() {
                case 1:
                    ToDo.MarkAsDone(index: userInputIndix)
                case 2:
                    ToDo.MarkAsNotDone(index: userInputIndix)
                case 3:
                    DeleteToDo(index: userInputIndix)
                    ViewUserList()
                    print("\n^\nAbove is Your ToDo List After Modification")
                case 9:
                    break
                default:
                    print("Invalid Input!")
                }
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
        let currentTodo = ToDo(index: 1, title: "", description: "", deadline: nil, done: true)
        print("\n\n")
        
        print("Enter Task Title: ", terminator: "")
        
        let currentTitle = Utils.readString()
        currentTodo.title = currentTitle
        
        print("Enter Description About Task, NO MORE THAN 350 LETTERS.: ", terminator: "")
        var currentDescription = Utils.readString()
        while currentDescription.count > 350 {
            print("Description Must Be 350 Letters or Less, Enter Description Again:", terminator: "")
            currentDescription = Utils.readString()
        }
        currentTodo.description = currentDescription
        
        print("Enter Deadline in this format dd-MM-yyyy")
        print("1 \tTos Skip")
        
        var currentDeadLine = Utils.readString()
        
        while currentDeadLine == "1" {
            print("Invalid Input!")
        }
        currentDeadLine = Utils.readString()
        
        print("\n\n")
        print("Your New ToDo is: (\(currentTodo.title)\t \(currentTodo.description)\t \(String(describing: currentTodo.deadline))\t \(currentTodo.done)")
        print("1 \tTo Save")
        print("2 \tTo Re-fill")
        print("3 \tTo Cancel")
        
        switch Utils.readInt() {
        case 1:
            UserList.toDoList.append(currentTodo)
        case 2:
            CreateNewToDo()
        case 3:
            break
        default:
            print("Type (1) To Save This Task, OR (2) To Re-enter, OR (3) To Cancel. ")
        }
    }
    
    static func DeleteToDo(index: Int) {
        UserList.toDoList.remove(at: index)
    }
}
