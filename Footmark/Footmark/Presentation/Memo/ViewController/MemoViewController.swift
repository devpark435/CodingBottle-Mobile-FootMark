//
//  MemoViewController.swift
//  Footmark
//
//  Created by 박현렬 on 11/20/23.
//

import UIKit

class MemoViewController: BaseViewController,MemoViewDelegate {
    var memoView: MemoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoView = MemoView(frame: view.bounds)
        memoView.delegate = self
        view.backgroundColor = .white
        view.addSubview(memoView)
        
    }
    func goodCardDidTap() {
        print("Tap GoodCard")
        let detailViewController = MemoDetailViewController(imageView: memoView.CardImageView, titleLabel: memoView.CardTitleLabel, dateTitleLabel: memoView.CardDateTitleLabel)
        detailViewController.modalPresentationStyle = .overCurrentContext
        detailViewController.modalTransitionStyle = .crossDissolve
        present(detailViewController, animated: true, completion: nil)
    }
}
