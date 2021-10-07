//
//  TasksViewController.swift
//  TasksApp
//
//  Created by Fernando Gonzalez on 9/29/21.
//

import UIKit

import AlamofireImage

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //outlets for table View cell drag and drop here
    @IBOutlet var tableView: UITableView!
    //variable
    var tasks = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call this after UITableViewDataSource, UITableViewDelegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // start calling api
        let url = URL(string: "http://127.0.0.1:8000/api/meals/")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data)
                 
                 self.tasks = dataDictionary as! [[String:Any]]
                 
                 self.tableView.reloadData()
                 
                 print(dataDictionary)

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
             }
        }
        task.resume()
    }
    //end of calling api
    
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns all the tasks
        return tasks.count
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        
        //connecting to api labels
        let task = tasks[indexPath.row]
        let title = task["meal_name"] as! String
        let description = task["updated_at"] as! String
        
        //displaying it to each label
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        
        //loading image
        let baseUrl = "http://127.0.0.1:8000"
        let imgPath = task["meal_photo"] as! String
        let imgUrl = URL(string: baseUrl + imgPath)
        
        cell.imgView.af.setImage(withURL: imgUrl!)
        
        
        //displaying it on screen
        return cell
    }
    
    
    //preparing th next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Task Detail")
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let task = tasks[indexPath.row]
        let detailsViewController = segue.destination as! TaskDetailsViewController
        detailsViewController.task = task
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        //end
    }
    
    
    
    
    
    
    
    
    
    

   //end
}
