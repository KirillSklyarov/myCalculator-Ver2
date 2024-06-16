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

    var firstNumberToCalc: Double = 0.0
    var secondNumberToCalc: Double = 0.0

    var firstEnter: String = "" {
        didSet {
            view?.updateUI(text: firstEnter)
        }
    }

    var show = 0.0 {
        didSet {
            let toShow = String(show)
            view?.updateUI(text: toShow)
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
            secondNumberToCalc = Double(firstEnter)!
            show = calculation()
        case "+/-":
            if Double(firstEnter)! < 0 {
                let new = firstEnter.dropFirst()
                firstEnter = String(new)
            } else {
                firstEnter = "-"+firstEnter
            }
            print(firstEnter)
        default: firstEnter += labelText
        }
    }

    func showResult() {
        if firstNumberToCalc == 0 {
            firstNumberToCalc = Double(firstEnter)!
        } else {
            secondNumberToCalc = Double(firstEnter)!
        }
        firstEnter = "0"
        print("firstEnter \(firstEnter),  firstNumber \(firstNumberToCalc), secondNumber \(secondNumberToCalc), operation \(operation)")
        firstNumberToCalc = calculation()
        show = firstNumberToCalc
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
        }
    }
}
