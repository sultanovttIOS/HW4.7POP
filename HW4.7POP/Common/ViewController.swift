//
//  ViewController.swift
//  HW4.7POP
//
//  Created by Alisher Sultanov on 4/2/24.
//

import UIKit
import SnapKit
import IQKeyboardManagerSwift
class ViewController: UIViewController {

    private lazy var titleLabel = MakerView.shared.makerLabel(text: "Выберите способ оплаты", font: UIFont.systemFont(ofSize: 24, weight: .bold), textColor: .black, numberOfLines: 1)
    
    private lazy var visaBtn = MakerView.shared.makerButton(title: "Visa", tintColor: .white, backgroundColor: .blue, cornerRadius: 12)
    
    private lazy var elkartBtn = MakerView.shared.makerButton(title: "Elkart", tintColor: .white, backgroundColor: .blue, cornerRadius: 12)
    
    private lazy var koronaBtn = MakerView.shared.makerButton(title: "Zolotaya Korona", tintColor: .white, backgroundColor: .blue, cornerRadius: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .cyan
        
        setupTitleLabel()
        setupVisa()
        setupElkart()
        setupKorona()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(300)
            make.height.equalTo(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }

    private func setupVisa() {
        view.addSubview(visaBtn)
        visaBtn.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(130)
            make.centerX.equalTo(view.snp.centerX)
        }
        visaBtn.addTarget(self, action: #selector(goVisaScreen), for: .touchUpInside)
    }
    
    @objc func goVisaScreen(_ sender: UIButton) {
        navigationController?.pushViewController(VisaViewController(), animated: true)
    }
    
    private func setupElkart() {
        view.addSubview(elkartBtn)
        elkartBtn.snp.makeConstraints { make in
            make.top.equalTo(visaBtn.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.width.equalTo(130)
            make.centerX.equalTo(view.snp.centerX)
        }
        elkartBtn.addTarget(self, action: #selector(goElkartScreen), for: .touchUpInside)
    }
    
    @objc func goElkartScreen(_ sender: UIButton) {
        navigationController?.pushViewController(ElkartViewController(), animated: true)
    }
    
    private func setupKorona() {
        view.addSubview(koronaBtn)
        koronaBtn.snp.makeConstraints { make in
            make.top.equalTo(elkartBtn.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.width.equalTo(130)
            make.centerX.equalTo(view.snp.centerX)
        }
        koronaBtn.addTarget(self, action: #selector(goKoronaScreen), for: .touchUpInside)
    }
    
    @objc func goKoronaScreen(_ sender: UIButton) {
        navigationController?.pushViewController(KoronaViewController(), animated: true)
    }
}

