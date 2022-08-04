//
//  SecondViewController.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/07/31.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var essentialFieldList = [UITextField]()
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordCheckTextField: UITextField!
    @IBOutlet var introduceView: UITextView!
    @IBOutlet var NextButton: UIButton!
    
    lazy var imagePicker: UIImagePickerController={
        let picker: UIImagePickerController=UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        if let selectImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                self.imageView.image = selectImage
                
            }
            self.dismiss(animated: true, completion: nil)
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.isUserInteractionEnabled = true
          //제쳐스 추가
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageViewTapped)))
        enableBtn(isOn: false)
        // Do any additional setup after loading the view.
    }
    
    //버튼 활성화 기능
    
    func enableBtn(isOn: Bool){
        switch isOn{
        case true:
            NextButton.isUserInteractionEnabled=true
            NextButton.tintColor = .blue
        case false:
            NextButton.isUserInteractionEnabled=false
            NextButton.tintColor = .gray
        }
    }
    
    @IBAction func textViewDidEndEditing(_ sender: UITextView){
        if sender.text.isEmpty{
            sender.text = ""
            self.enableBtn(isOn: false)
        }else if idTextField.text?.isEmpty == false {
            if let password = passwordTextField.text, let passwordCheck = passwordCheckTextField.text, password == passwordCheck, imageView.image != nil {
                NextButton.isUserInteractionEnabled = true
            }
        }
        
    }
    
    @IBAction func textFieldDidEndEditing(_ textField: UITextField){
        if textField.text?.isEmpty == true{
            self.enableBtn(isOn: false)
        }
        else if textField.text != ""{
            self.enableBtn(isOn: true)
        }
    }
    
    @IBAction func touchUpNextButton(_ sender: UIButton){
        UserInformation.shared.id = idTextField.text
        UserInformation.shared.password = passwordTextField.text
        UserInformation.shared.introduce = introduceView.text
    }
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
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
