//
//  MemoDetailView.swift
//  Footmark
//
//  Created by 박현렬 on 11/24/23.
//

import UIKit
import SnapKit
import Then

class MemoDetailView: BaseView {
    let cardImageView: UIView
    let cardTitleLabel: UILabel
    let cardDateTitleLabel: UILabel
    let closeButton = UIButton().then {
        if let closeSymbol = UIImage(systemName: "xmark") {
            let closeSymbolColor = closeSymbol.withTintColor(.black, renderingMode: .alwaysOriginal)
            $0.setImage(closeSymbolColor, for: .normal)
            
        }
    }
    let modyButton = UIButton().then {
        $0.setTitle("Edit", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        if let modySymbol = UIImage(systemName: "pencil.and.scribble") {
            let modySymbolColor = modySymbol.withTintColor(.black, renderingMode: .alwaysOriginal)
            $0.setImage(modySymbolColor, for: .normal)
        }
        $0.backgroundColor = UIColor(red: 0.68, green: 0.73, blue: 1, alpha: 0.3)
        $0.layer.cornerRadius = 12
    }
    init(imageView: UIView, titleLabel: UILabel, dateTitleLabel: UILabel) {
        self.cardImageView = imageView
        self.cardTitleLabel = titleLabel
        self.cardDateTitleLabel = dateTitleLabel
        super.init(frame: .zero)
        setUI()
    }
    
    override func setUI() {
        self.addSubviews(cardImageView, cardTitleLabel, cardDateTitleLabel, closeButton,modyButton)
    }
    override func setLayout() {
        closeButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            $0.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(-10)
        }
        cardTitleLabel.snp.makeConstraints{
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(closeButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(10)
        }
        cardDateTitleLabel.snp.makeConstraints{
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(cardTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(10)
        }
        cardImageView.snp.makeConstraints{
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(cardDateTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(10)
        }
        modyButton.snp.makeConstraints{
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
            $0.width.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.5)
            $0.height.equalTo(50)
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
