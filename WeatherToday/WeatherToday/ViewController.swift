//
//  ViewController.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var countries: [Country] = []
    //map함수 이용!
    var flagImages: [String] = ["kr", "jp", "it", "us", "de", "fr"].map { "flag_" + $0 }
    var assetName: String?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CountryTableViewCell
        let countries: Country = self.countries[indexPath.row]
        
        cell.setData(countries)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name:"countries")else{
            return
        }
        
        do{
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        }
        catch{
            print(error.localizedDescription)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else{
            return
        }
        
        guard let cell: CountryTableViewCell = sender as? CountryTableViewCell else{
            return
        }
        
        nextViewController.textToset = cell.countryLabel?.text
        //nextViewController.assetName = self.assetName
        print(nextViewController.textToset)
    
    }
    


}

