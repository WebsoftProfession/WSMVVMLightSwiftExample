//
//  EmployeeCell.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 10/08/23.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
