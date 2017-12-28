//
//  ViewController.swift
//  Unnamed-New-Project
//
//  Created by Aanya Jhaveri on 12/26/17.
//  Copyright © 2017 Aanya Jhaveri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var connection = establishConnection()
    
    @IBAction func createTable(_ sender: Any) {
        createNewTable(connection: connection)
    }
    
    @IBOutlet weak var itemDescription: UITextField!
    
    @IBAction func insertRow(_ sender: Any) {
        if let newItemDescription = itemDescription.text {
        addNewItem(nameOfItem: newItemDescription, connection: connection, table: pieces)
        }
    }
    
    @IBAction func printDatabase(_ sender: Any) {
        retrieveAllValues(connection: connection, table: pieces)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.itemDescription.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

