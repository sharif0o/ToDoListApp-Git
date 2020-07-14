//
//  ToDoDetailsViewController.swift
//  ToDoList
//
//

import UIKit

class ToDoDetailsViewController: UIViewController {
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var taskDetailsTextView: UITextView!
    
    @IBOutlet weak var taskCompletionButton: UIButton!
    
    @IBOutlet weak var taskCompletionDate: UILabel!
    
    weak var delegate: ToDoListDelegate?
    
    var toDoItem: ToDoItem!
    
    var toDoIndex: Int!
    
    let msg="hello world"
    let message="git test"

    override func viewDidLoad() {
        super.viewDidLoad()

       
        print(message)
        // Do any additional setup after loading the view.
        
        taskTitleLabel.text = toDoItem.name
        
        taskDetailsTextView.text = toDoItem.details
        
        if toDoItem.isComplete {
            
            disableButton()
            
        }
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMM dd, yyyy hh:mm"
        
        let taskDate = formatter.string(from: toDoItem.completionDate)
        
        taskCompletionDate.text = taskDate
        
    }
    
    func disableButton() {
        
        taskCompletionButton.backgroundColor = UIColor.gray
        
        taskCompletionButton.isEnabled = false
        
    }
    func completeTask(){
        
        toDoItem.isComplete = true
        delegate?.update(task: toDoItem, index: toDoIndex)
        disableButton()
        
    }
    
    @IBAction func taskDidComplete(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Complete the task", message: "Are you sure you would like to complete this task ?", preferredStyle: .actionSheet)
        let continueAction = UIAlertAction(title: "Continue", style: .default) { (action) in
            self.completeTask()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(continueAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)

        
        
    }
    

}
