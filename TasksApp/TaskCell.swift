//
//  TaskCell.swift
//  TasksApp
//
//  Created by Fernando Gonzalez on 9/29/21.
//

import UIKit

class TaskCell: UITableViewCell {
    
    // oulets of the primary taskViewController
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
