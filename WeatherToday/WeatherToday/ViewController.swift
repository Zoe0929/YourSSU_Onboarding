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
    var flagImages: [String] = ["flag_kr","flag_jp","flag_it","flag_us","flag_de","flag_fr"]
    var assetName: String?
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let countries: Country = self.countries[indexPath.row]
        
        cell.textLabel?.text = countries.koreanName
        
//        cell.flagImage.image = UIImage(systemName: flagImages[indexPath.row])
        
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
        
        self.tableView.reloadData()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else{
            return
        }
        nextViewController.textToset = cell.textLabel?.text
        //nextViewController.assetName = self.assetName
    
    }
    


}

