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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.isUserInteractionEnabled = true
          //제쳐스 추가
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageViewTapped)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        introduceView.layer.cornerRadius = 15
        enableBtn(isOn: false)
        
    }
    
    //이미지 뷰 탭 이용 이미지 선택
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
    
<<<<<<< HEAD
//    func textViewDidEndEditing(_ sender: UITextView!){
//        print("\(idTextField.text!) \(passwordTextField.text!) \(passwordCheckTextField.text!)")
//        let placehold:String = "자기소개 입력"
//        if sender.text.isEmpty{
//            sender.text=placehold
//            self.enableBtn(isOn: false)
//        }else if sender.text == placehold{
//            sender.text=""
//            self.enableBtn(isOn: false)
//        }else if textfieldisFill(), passwordCheck(passwordTextField, passwordCheckTextField) {
//            NextButton.isUserInteractionEnabled = true
//            self.enableBtn(isOn: true)
//            }
//    }
=======
    func textViewDidEndEditing(_ sender: UITextView!){
        print("\(idTextField.text!) \(passwordTextField.text!) \(passwordCheckTextField.text!)")
        let placehold:String = "자기소개 입력"
        if sender.text.isEmpty{
            sender.text=placehold
            self.enableBtn(isOn: false)
        }else if sender.text == placehold{
            sender.text=""
            self.enableBtn(isOn: false)
        }else if textfieldisFill(), passwordCheck(passwordTextField, passwordCheckTextField) {
            NextButton.isUserInteractionEnabled = true
            self.enableBtn(isOn: true)
            }
    }
>>>>>>> cee420e... 키보드 올리기, 버튼 활성화
    
    @IBAction func textFieldDidEndEditing(_ textField: UITextField){
        if textField.text?.isEmpty == true{
            self.enableBtn(isOn: false)
        }
        else if textField.text != ""{
            if textfieldisFill(), passwordCheck(passwordTextField, passwordCheckTextField){
                self.enableBtn(isOn: true)
            }
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

    //키보드 올라 올 때 뷰 올리기
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
           let keyboardRectangle = keyboardFrame.cgRectValue
       
            UIView.animate(
                withDuration: 0.5
                , animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: -(keyboardRectangle.height/9))
                }
            )
        }
    }
    @objc func keyboardDown() {
        self.view.transform = .identity
    }
    
    func passwordCheck(_ pw: UITextField, _ pwcheck:UITextField)->Bool{
        if pw.text == pwcheck.text {
            return true
        }
        else {return false}
    }
    func textfieldisFill()->Bool{
        if idTextField.text?.isEmpty == false , passwordTextField.text?.isEmpty == false, passwordCheckTextField.text?.isEmpty==false {
            return true
        }
        else {
            return false
        }
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
