//
//  MemoDetailViewController.swift
//  Footmark
//
//  Created by 박현렬 on 11/24/23.
//

import UIKit
import SnapKit
import Then

class MemoDetailViewController: BaseViewController {
    var memoDetailView: MemoDetailView!
    
    init(imageView: UIView, titleLabel: UILabel, dateTitleLabel: UILabel) {
        self.memoDetailView = MemoDetailView(imageView: imageView, titleLabel: titleLabel, dateTitleLabel: dateTitleLabel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.addSubview(memoDetailView)
        
        memoDetailView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide ).inset(30)
        }
        memoDetailView.backgroundColor = .white
        memoDetailView.layer.cornerRadius = 12
        
        memoDetailView.closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    @objc private func closeButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
}
