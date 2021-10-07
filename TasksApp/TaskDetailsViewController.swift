//
//  TaskDetailsViewController.swift
//  TasksApp
//
//  Created by Fernando Gonzalez on 9/29/21.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    //oulets
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    
    //storing
    var task: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskTitleLabel.text = task["meal_name"] as? String
        taskDescriptionLabel.text = task["updated_at"] as? String
        taskTitleLabel.sizeToFit()
        
        
        
    }
    

 

}
