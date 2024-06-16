//
//  MainPresenter.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func defaultButtonTapped(labelText: String)
}

final class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewControllerProtocol?

    var firstNumberToCalc: Double = 0.0 {
        didSet {
            let toShow = String(firstNumberToCalc)
            print("toShow \(toShow)")
            view?.updateUI(text: toShow)
        }
    }

    var secondNumberToCalc: Double = 0.0

    var firstEnter: String = "" {
        didSet {
            view?.updateUI(text: firstEnter)
        }
    }

    var operation: Operation = .noAction

    func defaultButtonTapped(labelText: String) {
        switch labelText {
        case "AC":
            firstEnter = ""
            firstNumberToCalc = 0
            secondNumberToCalc = 0
        case "/":
            showResult()
            operation = .division
        case "*":
            showResult()
            operation = .multiply
        case "-":
            showResult()
            operation = .subtraction
        case "+":
            showResult()
            operation = .addition
        case "=":
            showResult()
            operation = .noAction
        case "+/-":
            operation = .negative
            showResult()
        case "%":
            operation = .percent
            showResult()
        case ".":
            if !firstEnter.contains(".") {
                firstEnter += labelText
            }
        default: firstEnter += labelText
        }
    }

    func showResult() {
        if firstNumberToCalc == 0 {
            firstNumberToCalc = Double(firstEnter) ?? 0.0
        } else {
            secondNumberToCalc = Double(firstEnter) ?? 0.0
        }
        firstEnter = "0"
        firstNumberToCalc = calculation()
    }

    func calculation() -> Double {
        switch operation {
        case .addition: return firstNumberToCalc + secondNumberToCalc
        case .division:
            if secondNumberToCalc != 0 {
                return firstNumberToCalc / secondNumberToCalc
            } else { return firstNumberToCalc }
        case .multiply: return firstNumberToCalc * secondNumberToCalc
        case .subtraction: return firstNumberToCalc - secondNumberToCalc
        case .noAction: return firstNumberToCalc
        case .percent: operation = .noAction; return firstNumberToCalc / 100
        case .negative: operation = .noAction; return firstNumberToCalc * -1
        }
    }
}
