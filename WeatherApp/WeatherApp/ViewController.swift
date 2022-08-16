//
//  ViewController.swift
//  Weather
//
//  Created by 지희의 MAC on 2022/08/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    let cellIdentifier: String = "cell"
    let customcellIdentifer: String = "customCell"


    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["A","B","C","D","E","F","O","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
          case 0:
              return korean.count // 0번 섹션 : 한글
          case 1:
              return english.count //1번 섹션 : 영어
        case 2:
            return dates.count
          default:
              return 0
          }
    }
    
    //테이블 뷰 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //뷰의 재사용
             
        //데이터 세팅
        if indexPath.section<2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            return cell
        }
        else {
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customcellIdentifer, for: indexPath) as! CustomTableViewCell
            cell.leftLabel.text = self.dateFormatter.string(from:self.dates[indexPath.row])
            cell.rightLable.text = self.timeFormatter.string(from:self.dates[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section<2{
            return section == 0 ? "한글" : "영어"
        }
       return "현재 시간"
    }
    
    //button
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
        print(dates)
        self.tableView.reloadData()
//        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
}
 

