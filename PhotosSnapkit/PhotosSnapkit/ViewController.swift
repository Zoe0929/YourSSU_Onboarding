//
//  ViewController.swift
//  PhotosSnapKit
//
//  Created by 지희의 MAC on 2022/09/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let tableView = UITableView()
 


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red

        view.addSubview(tableView)
                
        // 1. superView에 맞게 적용
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        // 2. safeAreaLayoutGuide에 맞게 적용
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
                
        // 3. superView에 맞게 적용 한 뒤 inset 적용
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }

    }

    

}

