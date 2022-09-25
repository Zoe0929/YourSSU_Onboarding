//
//  SecondViewController.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/07/31.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate  {
    
    private var imageChanged: Bool = false
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordCheckTextField: UITextField!
    @IBOutlet var introduceView: UITextView!
    @IBOutlet var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.isUserInteractionEnabled = true
        //이미지 뷰 탭 gestureRecognizer 연결
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageViewTapped)))
        self.introduceView.delegate = self
        
        //키보드 활성화 시 탭 올라오는 함수 연결
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        introduceView.layer.cornerRadius = 15
        enableButton(isOn: false)
        
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
            // 이미지가 선택되었을 때 버튼이 활성화
                imageChanged = true
            }
            self.dismiss(animated: true, completion: nil)
        }
    
    
    //버튼 활성화 기능
    
    func enableButton(isOn: Bool){
        switch isOn{
        case true:
            nextButton.isUserInteractionEnabled=true
            nextButton.tintColor = .blue
        case false:
            nextButton.isUserInteractionEnabled=false
            nextButton.tintColor = .gray
        }
    }
    
    @objc func textViewDidEndEditing(_ sender: UITextView!){
        print("\(idTextField.text!) \(passwordTextField.text!) \(passwordCheckTextField.text!)")
        let placehold:String = "자기소개 입력"
        if sender.text.isEmpty{
            sender.text=placehold
            self.enableButton(isOn: false)
        }else if sender.text == placehold{
            sender.text=""
            self.enableButton(isOn: false)
        }else if conditioncheck(idTextField?.text , passwordTextField?.text , passwordCheckTextField?.text) {
            nextButton.isUserInteractionEnabled = true
            self.enableButton(isOn: true)
            }
        
    }
//
//    @IBAction func textFieldDidEndEditing(_ textField: UITextField){
//        if textField.text?.isEmpty == true{
//            self.enableButton(isOn: false)
//        }
//        else if textField.text != ""{
//            if textfieldisFill(), passwordCheck(passwordTextField, passwordCheckTextField){
//                self.enableButton(isOn: true)
//            }
//        }
//    }
    
    @IBAction func touchUpNextButton(_ sender: UIButton){
        UserInformation.shared.id = idTextField.text
        UserInformation.shared.password = passwordTextField.text
        UserInformation.shared.introduce = introduceView.text
    }
    
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
        UserInformation.shared.deleteDate()
    }
    
    //탭 제스처 이용해서 editing end
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
//    //조건 1 : password와 passwordCheck가 동일해야 함
//    func passwordCheck(_ pw: UITextField, _ pwcheck:UITextField)->Bool{
//        if pw.text == pwcheck.text {
//            return true
//        }
//        else {return false}
//    }
//    //조건 2 : 모든 textField가 채워져야 함
//    func textfieldisFill()->Bool{
//        if idTextField.text?.isEmpty == false , passwordTextField.text?.isEmpty == false, passwordCheckTextField.text?.isEmpty==false {
//            return true
//        }
//        else {
//            return false
//        }
//    }
//
    func conditioncheck(_ id: String?,_ pw: String?,_ pwcheck:String?)->Bool{
        if id?.isEmpty == false, pw?.isEmpty == false, pwcheck?.isEmpty == false{
            if pw == pwcheck {
                return true
            }
        }
        return false
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
