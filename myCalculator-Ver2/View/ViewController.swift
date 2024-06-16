//
//  ViewController.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func updateUI(text: String)
}

final class MainViewController: UIViewController {

    // MARK: - UI Properties
    private lazy var operationTextField: UITextField = {
        let textField = UITextField()
        textField.text = "0"
        textField.textAlignment = .right
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 50)
        textField.delegate = self

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.rightView = paddingView
        textField.rightViewMode = .always
        return textField
    }()

    private lazy var acButton = createButton(title: "AC", color: .gray)
    private lazy var plusMinusButton = createButton(title: "+/-", color: .gray)
    private lazy var percentButton = createButton(title: "%", color: .gray)
    private lazy var divideButton = createButton(title: "/", color: .orange)
    private lazy var sevenButton = createButton(title: "7", color: .blue)
    private lazy var eightButton = createButton(title: "8", color: .blue)
    private lazy var nineButton = createButton(title: "9", color: .blue)
    private lazy var multiplyButton = createButton(title: "*", color: .orange)
    private lazy var fourButton = createButton(title: "4", color: .blue)
    private lazy var fiveButton = createButton(title: "5", color: .blue)
    private lazy var sixButton = createButton(title: "6", color: .blue)
    private lazy var subtractButton = createButton(title: "-", color: .orange)
    private lazy var oneButton = createButton(title: "1", color: .blue)
    private lazy var twoButton = createButton(title: "2", color: .blue)
    private lazy var threeButton = createButton(title: "3", color: .blue)
    private lazy var additionButton = createButton(title: "+", color: .orange)
    private lazy var zeroButton = createButton(title: "0", color: .blue)
    private lazy var pointButton = createButton(title: ".", color: .blue)
    private lazy var equalButton = createButton(title: "=", color: .orange)

    private lazy var equalStack = setupHorizontalStack(arrangedSubviews: [pointButton, equalButton])

    private lazy var firstRowStack = setupHorizontalStack(arrangedSubviews: [acButton, plusMinusButton, percentButton, divideButton])
    private lazy var secondRowStack = setupHorizontalStack(arrangedSubviews: [sevenButton, eightButton, nineButton, multiplyButton])
    private lazy var thirdRowStack = setupHorizontalStack(arrangedSubviews: [fourButton, fiveButton, sixButton, subtractButton])
    private lazy var fourthRowStack = setupHorizontalStack(arrangedSubviews: [oneButton, twoButton, threeButton, additionButton])
    private lazy var fifthRowStack = setupHorizontalStack(arrangedSubviews: [zeroButton, equalStack])

    // MARK: - Presenter
    var presenter: MainPresenterProtocol

    // MARK: - Init
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - IB Actions
    @objc func defaultAction(sender: UIButton) {
        let title = sender.currentTitle ?? "0"
        presenter.defaultButtonTapped(labelText: title)
    }

    // MARK: - Private methods
    func updateUI(text: String) {
        guard let textDouble = Double(text) else {
            operationTextField.text = "0"; return }

        let isResultInt = textDouble.truncatingRemainder(dividingBy: 1) == 0

        operationTextField.text = isResultInt ? "\(Int(textDouble))" : "\(textDouble)"

    }


    private func createButton(title: String, color: Color, action: Selector = #selector(defaultAction)) -> UIButton {
        return super.setupButton(title: title, color: color, action: action)
    }

    private func setupUI() {
        view.backgroundColor = .darkGray

        let contentStack = UIStackView(arrangedSubviews: [operationTextField, firstRowStack, secondRowStack, thirdRowStack, fourthRowStack, fifthRowStack])
        contentStack.axis = .vertical
        contentStack.spacing = 1
        contentStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(contentStack)

        NSLayoutConstraint.activate([
            contentStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            contentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {

}

// MARK: - MainViewControllerProtocol
extension MainViewController: MainViewControllerProtocol {

}
