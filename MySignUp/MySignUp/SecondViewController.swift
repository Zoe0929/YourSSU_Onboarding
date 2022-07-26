//
//  SecondViewController.swift
//  MySignUp
//
//  Created by 지희의 MAC on 2022/07/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLable :UILabel!
    @IBOutlet weak var ageLable :UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLable.text=UserInformation.shared.name
        ageLable.text=UserInformation.shared.age

    }
    @IBAction func popToprev(){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
