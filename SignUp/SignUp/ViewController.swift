//
//  ViewController.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/07/30.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idField.text = UserInformation.shared.id
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }


}

