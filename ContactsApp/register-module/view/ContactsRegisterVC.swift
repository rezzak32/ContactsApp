//
//  ContactsRegisterVC.swift
//  ContactsApp
//
//  Created by Rezzak on 6.09.2023.
//

import UIKit

class ContactsRegisterVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var registerPresenterObject: ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RegisterRouter.createModule(ref: self)
    }
    
    @IBAction func addButton(_ sender: Any) {
        if let nameperson = nameTextField.text, let phoneperson = phoneTextField.text {
            registerPresenterObject?.add(name: nameperson, phone: phoneperson)
            self.navigationController?.popViewController(animated: true)

        }
    }
    
    


}
