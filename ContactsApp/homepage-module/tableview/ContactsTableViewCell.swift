//
//  ContactsTableViewCell.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
