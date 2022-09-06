//
//  ContentCollectionViewHeader.swift
//  NetflixStyleSampleApp
//
//  Created by 곽재선 on 2022/09/04.
//

import UIKit

// 반드시 ReusableView 형태여야 헤더 또는 푸터가 될 수 있음
class ContentCollectionViewHeader: UICollectionReusableView {
    let sectionNameLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        sectionNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        sectionNameLabel.textColor = .black
        sectionNameLabel.sizeToFit()
        
        addSubview(sectionNameLabel)
        
        sectionNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.leading.equalToSuperview().offset(10)
        }
    }
}
