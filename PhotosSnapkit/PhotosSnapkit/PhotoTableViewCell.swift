//
//  PhotoTableViewCell.swift
//  PhotosSnapKit
//
//  Created by 지희의 MAC on 2022/09/20.
//

import UIKit
import SnapKit

class PhotoTableViewCell: UITableViewCell {

    let myImageView = UIImageView()
    let detailButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("자세히 보기", for: .normal)
        bt.setTitleColor(UIColor.blue, for: .normal)
        bt.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
           
        [myImageView,detailButton].forEach {
            contentView.addSubview($0)
        }
           
        myImageView.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview().inset(10)
            make.width.height.equalTo(50)
        }
        
        detailButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.right.leading.equalToSuperview().inset(30)
        }
        
           
       }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
