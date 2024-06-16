//
//  ViewController.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

//MARK: - SwiftUI
import SwiftUI
struct ProviderMain : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }

    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return MainViewController()
        }

        typealias UIViewControllerType = UIViewController


        let viewController = MainViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<ProviderMain.ContainterView>) -> MainViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: ProviderMain.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProviderMain.ContainterView>) {

        }
    }
}
