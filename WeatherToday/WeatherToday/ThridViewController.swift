//
//  ThridViewController.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/23.
//

import UIKit

class ThridViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView?
    @IBOutlet weak var weatherLabel:UILabel?
    @IBOutlet weak var temperatureLabel:UILabel?
    @IBOutlet weak var rainfallLabel:UILabel?
    var textToSet: String?
    var weatherToset:UIImage?
    var weatherTextToSet: String?
    var tempToset:String?
    var rainToset:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = textToSet
        self.weatherImage?.image = weatherToset
        self.weatherLabel?.text = weatherTextToSet
        self.temperatureLabel?.text = tempToset
        self.rainfallLabel?.text = rainToset
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
