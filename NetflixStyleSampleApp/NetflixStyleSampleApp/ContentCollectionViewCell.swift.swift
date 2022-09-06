//
//  ContentCollectionViewCell.swift.swift
//  NetflixStyleSampleApp
//
//  Created by 곽재선 on 2022/09/03.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // contentView : UICollectionViewCell의 경우 self.backgroundColor 이런식으로 하면 실제로 레이아웃에 표현되지 않음.
        //               셀의 레이아웃을 표현하는것은 contentView라는 기본 객체를 통해 이 위에 서브뷰를 올려야함
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        self.imageView.contentMode = .scaleAspectFill
        
        // 스토리보드에서 +버튼을 눌러서 라벨 버튼등을 끌어오는 것과 동일
        contentView.addSubview(self.imageView)
        
        // Snapkit 오토 레이아웃 설정
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
