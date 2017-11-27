//
//  ViewController.swift
//  GO-iOS
//
//  Created by Gabriel I Leyva Merino on 11/20/17.
//  Copyright © 2017 Gabriel Leyva Merino. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var goOutButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var client: TCPClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.connectToClient()
        self.prepareGoButton()
    }
    
    func prepareGoButton() {
        goOutButton.setTitleColor(.green, for: .normal)
        goOutButton.layer.borderColor = UIColor.green.cgColor
        goOutButton.layer.borderWidth = 1
        goOutButton.layer.cornerRadius = 5
    }

    func connectToClient(){
        let cl = TCPClient(address: "127.0.0.1", port: 6666)
        
        client = cl
        
        switch self.client!.connect(timeout: 30) {
        case .success:
            print("Connected!")
            break
        // Connection successful
        case .failure(let error):
            print(error)
            break
        }
    }
    
    @IBAction func goOutButtonPressed(_ sender: Any) {
        let message = textField.text!
        if let data = message.data(using: String.Encoding.utf8){
            print(data)
            let result = client!.send(data: data)
            print(result)
            
            guard let data = client!.read(1024*10) else { return }
            
            if let response = String(bytes: data, encoding: .utf8) {
                print(response)
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  UITableViewCell()
        
        return cell
    }

}

