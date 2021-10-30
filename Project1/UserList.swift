
import Foundation

class UserList {
    static var toDoList = [ToDo]()
    
    func ViewUserList() {
        var index = 0
        
        while UserList.toDoList.isEmpty {
            print("\n\n")
            print("Your ToDo List is Empty Right Now..")
            print("1 \tIf You Want To Create Your First ToDo")
            print("9 \tTo Cancel And Go Back To The Main Menu\n")
            print("0 \tTo End And Close The Program")
            let userInput = Utils.readInt()
            switch userInput {
            case 1:
                CreateNewToDo()
            case 9:
                break
            case 0:
                print("")
                // Close()
            default:
                print("Invalid Input, Please Type (1), OR Cancel And Go Back To The Main Menu Type (2), OR (0) To End And Close The Program.")
            }
        }
        
        for i in UserList.toDoList {
            print("\(i.index),\t\(i.title),\t\(i.description),\t\(String(describing: i.deadline)),\t\(i.done)")
            index += 1
        }
        
        // Operations on UserList
        print("\n")
        print("Above is Your List Of Task")
        print("1 \t\tIf You Want To Do Some Operations On Your List Such As Mark-As-Done, Or Sort Or Delete")
        print("Or 9 \tTo Go Back To The Main Menu")
        print("Or 0 \tTo Close And Exit The Program")
        
        let userInput = Utils.readInt()
        
        switch userInput {
        case 1:
            print("Please Select a ToDo By Typing Its Index Number, Then Click Enter.")
            let userInputIndix = Utils.readInt()
            let currentToDoIndex = UserList.toDoList[userInputIndix]
            
            print("Your Selected ToDo is\(currentToDoIndex), Now Choose The Operation You Want To Do From The Following: ")
            print("\n1\t To Mark a ToDo As Done")
            print("2\t To Mark a ToDo As (Not) Done")
            print("3\t To Remove a ToDo From Your List")
            print("4\t To Sort Your ToDo List By Nearest Deadline")
            print("5\t To Sort Your ToDo List By Farthest Deadline")
            print("6\t to Sort Your ToDo List By Creation First")
            print("7\t To Search In Your ToDo List")
            print("9\t To Go back to Main Menu")
            print("0\t To Close And Exit The Program")
            
            switch Utils.readInt() {
            case 1:
                MarkAsDone(index: userInputIndix)
            case 2:
                MarkAsNotDone(index: userInputIndix)
            case 3:
                DeleteToDo(index: userInputIndix)
                print("Your ToDo List After Modification You Did is: ")
                ViewUserList()
            case 9:
                GoBackToMainMenu()
            case 0:
                close()
            default:
                print("Invalid Input........")
            }
            
        case 9:
            break
        case 0:
            close()
        default:
            print("Invalid Input!")
        }
    }
        
        
        // CreateNewToDo Function
        func CreateNewToDo() {
            let currentTodo = ToDo(index: 1, title: "", description: "", deadline: nil, done: true)
            print("\n\n")
            
            print("Enter Task Title: ", terminator: "")
            
            let currentTitle = Utils.readString()
            currentTodo.title = currentTitle
            
            print("Enter Description About Task, NO MORE THAN 350 LETTERS.: ", terminator: "")
            var currentDescription = Utils.readString()
            while currentDescription.count > 350 {
                print("Description Must Be 180 Letters or Less, Enter Description Again:", terminator: "")
                currentDescription = Utils.readString()
            }
            currentTodo.description = currentDescription
            
            print("Enter Deadline in this format dd-MM-yyyy, or Skip by typing(1)", terminator: "")
            var currentDeadLine = Utils.readString()
            if currentDeadLine == "1" {
//                continue
            }
            else if currentDeadLine != "1" {
                currentDeadLine = Utils.readString()
                //                currentTodo.deadline = currentDeadLine (Fix This error!!)
            } else {
                print("Invalid Input, Please Enter(1) to skip entering DeadLine Task, or (2) to add deadline in this format dd-MM-yyyy")
            }
            
            //            if stringToDate(currentDeadLine) != nil {
            //                currentTodo = ToDo(title: currentTitle, description: currentDescription, deadline: stringToDate(currentDeadLine), done: false)
            //            } else {
            //                currentTodo = ToDo(title: currentTitle, description: currentDescription, deadline: nil, done: false)
            //            }
            print("\n\n")
            print("Your New ToDo: (\(currentTodo.title)\t \(currentTodo.description)\t \(String(describing: currentTodo.deadline))\t \(currentTodo.done)")
            print("1 \tTo Add It To Your List Of Tasks")
            print("2 \tTo Re-enter It")
            print("3 \tTo Cancel Creating New ToDo")
            
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
        
        
        // Mark as done and re-mark functions
        func MarkAsDone(index: Int) {
            if !UserList.toDoList[index].done {
                UserList.toDoList[index].done = true
            } else {
                print("This ToDo is Already Marked As Done!")
            }
        }
        
        func MarkAsNotDone(index: Int) {
            if UserList.toDoList[index].done {
                UserList.toDoList[index].done = false
            } else {
                print("This ToDo is Already Marked As Done!")
            }
        }
        
        
        // Delete todo function
        func DeleteToDo(index: Int) {
            UserList.toDoList.remove(at: index)
        }
        
        // Go back to main menu && close functions
        func GoBackToMainMenu() {
            //This always should take me to the main menu
        }
        
        func close() {
            //this should always close program
        }
    }




