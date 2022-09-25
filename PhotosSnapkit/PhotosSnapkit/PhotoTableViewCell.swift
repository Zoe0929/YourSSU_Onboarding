//
//  PhotoTableViewCell.swift
//  PhotosSnapKit
//
//  Created by 지희의 MAC on 2022/09/20.
//

import UIKit
import SnapKit

class PhotoTableViewCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myImageView)
           
        myImageView.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.left.leading.equalTo(self).offset(20)
            $0.height.width.equalTo(60)	
        }
        
           
       }
    
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
