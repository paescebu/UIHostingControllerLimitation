//
//  ViewController.swift
//  UIHostingLimitation
//
//  Created by Pascal Burlet on 07.06.23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.addTarget(self, action:#selector(self.randomBackgroundColor), for: .touchUpInside)
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var expandingView: UIHostingController<ExpandingView> = {
        let hostingController = UIHostingController(rootView: ExpandingView())
        hostingController.sizingOptions = .intrinsicContentSize
        hostingController.view.backgroundColor = .clear
        return hostingController
    }()
    
    lazy var expandingViewAnimated: UIHostingController<ExpandingViewAnimated> = {
        let hostingController = UIHostingController(rootView: ExpandingViewAnimated())
        hostingController.sizingOptions = .intrinsicContentSize
        hostingController.view.backgroundColor = .clear
        return hostingController
    }()
    
    lazy var expandingViewAnimatedExpected: UIHostingController<ExpandingViewAnimatedExpected> = {
        let hostingController = UIHostingController(rootView: ExpandingViewAnimatedExpected())
        hostingController.sizingOptions = .intrinsicContentSize
        hostingController.view.backgroundColor = .clear
        return hostingController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layoutView()
        self.layoutButton()
        self.layoutExpandingView()
        self.layoutExpandingViewAnimated()
        self.layoutExpandingViewAnimatedExpected()
    }
    
    private func layoutView() {
        self.view.backgroundColor = .white
    }
    
    private func layoutButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.view.trailingAnchor.constraint(
                equalTo: button.trailingAnchor,
                constant: 0),
            self.view.topAnchor.constraint(
                equalTo: button.topAnchor,
                constant: -150),
            button.heightAnchor.constraint(
                equalToConstant: 50),
            button.widthAnchor.constraint(
                equalToConstant: 190)
        ])
    }
    
    private func layoutExpandingView() {
        self.addChild(expandingView)
        view.addSubview(expandingView.view)
        expandingView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.view.trailingAnchor.constraint(
                equalTo: expandingView.view.trailingAnchor),
            self.view.topAnchor.constraint(
                equalTo: expandingView.view.topAnchor)
        ])
    }
    
    private func layoutExpandingViewAnimated() {
        self.addChild(expandingViewAnimated)
        view.addSubview(expandingViewAnimated.view)
        expandingViewAnimated.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            expandingView.view.leadingAnchor.constraint(
                equalTo: expandingViewAnimated.view.trailingAnchor,
                constant: 20),
            expandingView.view.topAnchor.constraint(
                equalTo: expandingViewAnimated.view.topAnchor)
        ])
    }
    
    private func layoutExpandingViewAnimatedExpected() {
        self.addChild(expandingViewAnimatedExpected)
        view.addSubview(expandingViewAnimatedExpected.view)
        expandingViewAnimatedExpected.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            expandingViewAnimated.view.leadingAnchor.constraint(
                equalTo: expandingViewAnimatedExpected.view.trailingAnchor,
                constant: 20),
            expandingViewAnimated.view.topAnchor.constraint(
                equalTo: expandingViewAnimatedExpected.view.topAnchor)
        ])
    }
    
    @objc private func randomBackgroundColor() {
        self.view.backgroundColor = .random()
    }
}

