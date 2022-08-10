//
//  ThirdViewController.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/08/02.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var essationElement = [UITextField]()
    
    @IBOutlet weak var signDatePicker: UIDatePicker!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var signButton: UIButton!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter .timeStyle = .medium
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        enableBtn(isOn: false)
        if UserInformation.shared.PhoneNumber != "", UserInformation.shared.birthday != nil{
            phoneTextField.text=UserInformation.shared.PhoneNumber
            dateLabel.text = UserInformation.shared.birthday?.formatted()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didDaePickerValueChanged(_ sender: UIDatePicker){
        let date: Date = self.signDatePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        UserInformation.shared.birthday = date
        enableBtn(isOn: true)
        
    }
    
//    @IBAction func phoneNumberEditingEnd(_ sender: UITextField ){
//        UserInformation.shared.PhoneNumber = phoneTextField.text
//        if signDatePicker.date != nil{
//            enableBtn(isOn: true)
//        }
//
//    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton){
        UserInformation.shared.PhoneNumber = phoneTextField.text
        print(UserInformation.shared.id)
        print(UserInformation.shared.password)
        print(UserInformation.shared.birthday)
        print(UserInformation.shared.introduce)
        
    }

    
    func enableBtn(isOn: Bool){
        switch isOn{
        case true:
            signButton.isUserInteractionEnabled=true
            signButton.tintColor = .blue
        case false:
            signButton.isUserInteractionEnabled=false
            signButton.tintColor = .gray
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
