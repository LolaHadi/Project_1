import Foundation

var userInput: Int = 0

// Welcome Message
print("Welcom to (Manage My Brain Program) \nPlease Type The Number That Corresponds To The Option You Want, And Then Click (Enter) From The Keyboard to Continue. \n")

// Main Menu
print("1 \t To View Your ToDo List")
print("2 \t To Create a New ToDo \n")
print("0 \t To Exit & Close The Program")
print("Note: If You Want to Run The program Again, Just Use The Shortcut (command+R) From The Keyboard")

let userInputSelection = Utils.readInt()
let ul = UserList()

switch userInputSelection {
case 1:
    ul.ViewUserList()
case 2:
    ul.CreateNewToDo()
case 0:
    print("")
default:
    print("Invalid Input, Please Enter a Number and then click Enter.")
    print("1 to view List, 2 to add new Task, 9 to go back, and 0 to exitqq")
}
