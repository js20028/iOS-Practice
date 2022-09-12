//
//  BeerListCell.swift
//  Brewery
//
//  Created by 곽재선 on 2022/09/09.
//

import UIKit
import SnapKit
import Kingfisher

class BeerListCell: UITableViewCell {
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerImageView, nameLabel, taglineLabel].forEach {
            contentView.addSubview($0)
        }
        
        beerImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0
        
        beerImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(beerImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        taglineLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
        beerImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "beer_icon"))    // with: URL 또는 여러가지 형태의 이미지 소스, placeholder: URL이 빈값이거나 이미지와 연결되어있지않거나 할때 비어있는 이미지뷰를 표시하기위한 기본이미지 설정
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagLine
        
        self.accessoryType = .disclosureIndicator   // 셀의 우측에 > 모양의 화살표가 자동으로 추가됨
        self.selectionStyle = .none // 셀을 탭해도 회색음영이 발생하지 않음
    }
}
