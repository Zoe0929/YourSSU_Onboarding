//
//  ViewController.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/07/30.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var imagePicker: UIImagePickerController={
        let picker: UIImagePickerController=UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @ IBAction func touchUpSelectImageButton(_sender: UIButton){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

