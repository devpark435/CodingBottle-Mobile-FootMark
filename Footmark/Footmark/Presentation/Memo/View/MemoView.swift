//
//  MemoView.swift
//  Footmark
//
//  Created by 박현렬 on 11/20/23.
//

import UIKit
import SnapKit
import Then
protocol MemoViewDelegate: AnyObject {
    func goodCardDidTap()
}
class MemoView: BaseView {
    weak var delegate: MemoViewDelegate?
    let goodLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 17)
        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.5
    }
    let goodLayout = UIView().then{
        $0.backgroundColor = UIColor(red: 0.68, green: 0.73, blue: 1, alpha: 1)
        $0.layer.cornerRadius = 12
    }
    let goodCard = UIView().then{
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.68, green: 0.73, blue: 1, alpha: 1).cgColor
    }
    let CardImageView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        //        $0.image = UIImage(named: "profileImage")
        $0.backgroundColor = UIColor(red: 0.68, green: 0.73, blue: 1, alpha: 0.3)
    }
    let CardTitleView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        //        $0.image = UIImage(named: "profileImage")
        
    }
    let CardTitleLabel = UILabel().then {
        $0.text = "Card Title"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    let CardDateTitleLabel = UILabel().then {
        $0.text = "Date : yy - mm - dd"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .lightGray
    }
    let goodScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
    }
    let sadLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 17)
        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.5
    }
    let sadLayout = UIView().then{
        $0.backgroundColor = UIColor(red: 0.92, green: 0.67, blue: 0.67, alpha: 1)
        $0.layer.cornerRadius = 12
    }
    let sadCard = UIView().then{
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.92, green: 0.67, blue: 0.67, alpha: 1).cgColor
    }
    let sadScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
    }
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        goodCard.addGestureRecognizer(tapGesture)
    }
    @objc private func handleTap() {
        delegate?.goodCardDidTap()
    }
    override func setUI(){
        goodLabel.text = "Good"
        sadLabel.text = "Sad"
        addSubview(goodLayout)
        goodLayout.addSubview(goodLabel)
        addSubview(sadLayout)
        sadLayout.addSubview(sadLabel)
        addSubview(goodScrollView)
        goodScrollView.addSubview(goodCard)
        goodCard.addSubviews(CardImageView,CardTitleView)
        CardTitleView.addSubviews(CardTitleLabel,CardDateTitleLabel)
        addSubview(sadScrollView)
        sadScrollView.addSubview(sadCard)
        
    }
    override func setLayout(){
        goodLayout.snp.makeConstraints{
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            $0.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
            $0.height.equalTo(50)
        }
        goodLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        goodScrollView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(goodLayout.snp.bottom).offset(20)
            $0.width.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.3)
            $0.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.3)
        }
        goodCard.snp.makeConstraints{
            $0.width.height.equalToSuperview().offset(-10)
        }
        sadLayout.snp.makeConstraints{
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(goodScrollView.snp.bottom)
            $0.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
            $0.height.equalTo(50)
        }
        sadLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        sadScrollView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(sadLayout.snp.bottom).offset(20)
            $0.width.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.3)
            $0.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.3)
        }
        sadCard.snp.makeConstraints{
            $0.width.height.equalToSuperview().offset(-20)
        }
        CardImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(Float(2)/Float(3))
        }
        CardTitleView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(CardImageView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(Float(1)/Float(3))
        }
        
        
        CardTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalToSuperview().multipliedBy(Float(1)/Float(2))
        }
        
        CardDateTitleLabel.snp.makeConstraints{
            $0.top.equalTo(CardTitleLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalToSuperview().multipliedBy(Float(1)/Float(2))
            $0.bottom.equalToSuperview().offset(-10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
