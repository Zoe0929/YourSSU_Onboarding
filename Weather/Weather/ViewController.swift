//
//  ViewController.swift
//  Weather
//
//  Created by 지희의 MAC on 2022/08/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
          case 0:
              return korean.count // 0번 섹션 : 한글
          case 1:
              return english.count //1번 섹션 : 영어
          default:
              return 0
          }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        //뷰의 재사용?
             
        //데이터 세팅
        let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
             
        cell.textLabel?.text = text
        return cell

    }
    
    

    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["A","B","C","D","E","F","O","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "한글" : "영어"
    }
    
}
 
