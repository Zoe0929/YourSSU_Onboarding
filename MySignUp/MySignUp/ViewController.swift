//
//  ViewController.swift
//  MySignUp
//
//  Created by 지희의 MAC on 2022/07/24.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!

    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.name=nameField.text
        UserInformation.shared.age=ageField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

