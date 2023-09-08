//
//  ContactsDetailVC.swift
//  ContactsApp
//
//  Created by Rezzak on 6.09.2023.
//

import UIKit

class ContactsDetailVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var detailPresenterObject: ViewToPresenterDetailProtocol?
    
    var contact: Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let c = contact {
            nameTextField.text = c.name
            phoneTextField.text = c.phone
        }
        
        DetailsRouter.createModule(ref: self)
    }
    

    @IBAction func updateButton(_ sender: Any) {
        if let nameperson = nameTextField.text, let phoneperson = phoneTextField.text, let c = contact {
            detailPresenterObject?.update(id: c.id!, name: nameperson, phone: phoneperson)
            self.navigationController?.popViewController(animated: true)

        }
    }
    
    

}
