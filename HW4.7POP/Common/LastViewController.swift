//
//  LastViewController.swift
//  HW4.7POP
//
//  Created by Alisher Sultanov on 6/2/24.
//

import UIKit
import SnapKit

class LastViewController: UIViewController {

    private lazy var completeTransferLbl = MakerView.shared.makerLabel(text: "Перевод выполнен!",
                                                                       font: UIFont.systemFont(ofSize: 30,
                                                                       weight: .bold), textColor: .black, numberOfLines: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .cyan
        setupCompleteLabel()
    }
    
    private func setupCompleteLabel() {
        view.addSubview(completeTransferLbl)
        completeTransferLbl.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
}
