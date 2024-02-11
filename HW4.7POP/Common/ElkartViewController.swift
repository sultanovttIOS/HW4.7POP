//
//  ElkartViewController.swift
//  HW4.7POP
//
//  Created by Alisher Sultanov on 5/2/24.
//

import UIKit
import SnapKit
import IQKeyboardManagerSwift

class ElkartViewController: UIViewController, TransferProtocol {
    
    private var isRequisiteValid: Bool = false
    private var isSumValid: Bool = false
    private let myBalance = 2000.0
    
    private let requisiteTF = MakerView.shared.makerTf(placeholder: "Введите номер карты",
                                                       cornerRadius: 12, backgroundColor: .white)
    
    private lazy var sumTF = MakerView.shared.makerTf(placeholder: "Введите сумму",
                                                      cornerRadius: 12, backgroundColor: .white)
    
    
    private lazy var recipientRequisiteLabel = MakerView.shared.makerLabel(text: "Номер карты отправителя: 9417608998854267",
                                                                           font: UIFont.systemFont(ofSize: 20, weight: .semibold), textColor: .black, numberOfLines: 2)
    
    private lazy var recipientBalanceLabel = MakerView.shared.makerLabel(text: "Баланс: 2000.0 сом",
                                                                         font: UIFont.systemFont(ofSize: 20, weight: .semibold), textColor: .black, numberOfLines: 2)
    
    private lazy var transferBtn = MakerView.shared.makerButton(title: "Перевести", tintColor: .white,
                                                                backgroundColor: .darkGray, cornerRadius: 14, isEnabled: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .cyan
        
        setupRequisiteTf()
        setupSumTf()
        setupRecipientLabel()
        setupBalanceLabel()
        setupMakeTransfer()
    }
    
    private func setupRequisiteTf() {
        view.addSubview(requisiteTF)
        requisiteTF.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        requisiteTF.addTarget(self, action: #selector(validateFields), for: .editingChanged)
    }
    
    private func setupSumTf() {
        view.addSubview(sumTF)
        sumTF.snp.makeConstraints { make in
            make.top.equalTo(requisiteTF.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        sumTF.addTarget(self, action: #selector(validateFields), for: .editingChanged)
    }
    
    private func setupRecipientLabel() {
        view.addSubview(recipientRequisiteLabel)
        recipientRequisiteLabel.snp.makeConstraints { make in
            make.top.equalTo(sumTF.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.horizontalEdges.equalTo(sumTF.snp.horizontalEdges)
        }
    }
    
    private func setupBalanceLabel() {
        view.addSubview(recipientBalanceLabel)
        recipientBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(recipientRequisiteLabel.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.leading.equalTo(recipientRequisiteLabel.snp.leading)
            make.width.equalTo(150)
        }
    }
    
    private func setupMakeTransfer() {
        view.addSubview(transferBtn)
        transferBtn.snp.makeConstraints { make in
            make.top.equalTo(recipientBalanceLabel.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.width.equalTo(150)
            make.centerX.equalTo(view.snp.centerX)
        }
        transferBtn.addTarget(self, action: #selector(completeTransfer), for: .touchUpInside)
    }
    
    @objc private func validateFields() {
        isRequisiteValid = validateCardNumber(tf: requisiteTF)
        isSumValid = validateSumTransfer(tf: sumTF, balance: myBalance, transferSum: Double(sumTF.text ?? "") ?? 0)
        updateTransferButtonState()
    }
    
    private func updateTransferButtonState() {
        if isRequisiteValid && isSumValid {
            transferBtn.isEnabled = true
            transferBtn.backgroundColor = .systemGreen
        } else {
            transferBtn.isEnabled = false
            transferBtn.backgroundColor = .darkGray
        }
    }
    
    @objc func completeTransfer(_ sender: UIButton) {
        if isRequisiteValid && isSumValid {
            let vc = LastViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
