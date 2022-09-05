//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/23.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "weatherCell"
    var cityWeathers: [CityWeather] = []
    var weatherImages: [String] = ["rainy", "snowy", "sunny","cloudy"]
    var weatherKr: [String] = ["비","눈","맑음","흐림"]
    
    var textToset: String?
    
    //cell의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityWeathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherTableViewCell = (tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherTableViewCell)!
        
        let cityWeather: CityWeather = self.cityWeathers[indexPath.row]
        cell.setData(cityWeather)
        return cell
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = textToset
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let textToset = textToset else {
            return
        }
        countryWeather(textToset)
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    //데이터 셋 불러오기
    func countryWeather(_ name: String){
        if name == "한국"{
            dataEncoding("kr")
            print("한국")
        }
        else if name == "독일"{
            dataEncoding("de")
        }else if name == "이탈리아"{
            dataEncoding("it")
        }else if name == "미국"{
            dataEncoding("us")
        }else if name == "프랑스"{
            dataEncoding("fr")
        }else if name == "일본"{
            dataEncoding("jp")
        }
    }
    
    func dataEncoding(_ dataName: String){
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name:dataName)else{
            return
        }
        
        do{
            self.cityWeathers = try jsonDecoder.decode([CityWeather].self, from: dataAsset.data)
        }
        catch{
            print(error.localizedDescription)
        }
    }
      
    
        
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ThridViewController = segue.destination as? ThridViewController else{
            return
        }
        
        guard let cell: WeatherTableViewCell = sender as? WeatherTableViewCell else{
            return
        }
        
        nextViewController.textToSet = cell.cityLabel?.text
        nextViewController.tempText = cell.stateLabel?.text
        nextViewController.rainText = cell.rainfallLabel?.text
        nextViewController.weatherToset = cell.weatherImageView?.image

        print(cell.weatherImageView?.image)
        if cell.weatherImageView?.image == UIImage(named: "\(weatherImages[0]).jpg"){
            nextViewController.weatherText = weatherKr[0]
        }
        else if cell.weatherImageView?.image == UIImage(named: "\(weatherImages[1]).jpg"){
            nextViewController.weatherText = weatherKr[1]
        }
        else if cell.weatherImageView?.image == UIImage(named: "\(weatherImages[2]).jpg"){
            nextViewController.weatherText = weatherKr[2]
        }
        else if cell.weatherImageView?.image == UIImage(named: "\(weatherImages[3]).jpg"){
            nextViewController.weatherText = weatherKr[3]
        }
    }
}

