//
//  ViewController.swift
//  ContactsApp
//
//  Created by Rezzak on 6.09.2023.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    var contactsList = [Contacts]()
    
    var homePagePresenterObject: ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        HomePageRouter.createModule(ref: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.uploadContacts()
    }
}

extension HomePageVC: PresenterToViewHomePageProtocol {
    func sendDataToView(contactsList: Array<Contacts>) {
        self.contactsList = contactsList
        DispatchQueue.main.async {
            self.contactsTableView.reloadData()
        }
    }
    
    
}

extension HomePageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            homePagePresenterObject?.uploadContacts()

        }else {
            homePagePresenterObject?.search(searchText: searchText)

        }
    }
    
}

extension HomePageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell") as! ContactsTableViewCell
        cell.contactsLabel.text = "\(contact.name!) - \(contact.phone!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactsList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: contact)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let contact = sender as? Contacts
            let vc = segue.destination as! ContactsDetailVC
            vc.contact = contact
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contact = contactsList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view,bool) in
            let alert = UIAlertController(title: "Delete", message: "Confirm delete \(contact.name!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                self.homePagePresenterObject?.delete(id:contact.id!)
                
            }
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
    
    
}


