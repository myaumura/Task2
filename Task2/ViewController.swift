//
//  ViewController.swift
//  Task2
//
//  Created by Gusev Kirill on 05.11.2024.
//

import UIKit

class ViewController: UIViewController {

    private var button1: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.title = "First Button"
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        button.configuration = configuration
        return button
    }()
    
    private var button2: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.title = "Second Middle Button"
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        button.configuration = configuration
        return button
    }()
    
    private var button3: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.title = "Third"
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        button.configuration = configuration
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupButtons()
    }
    
    private func setupButtons() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            button2.centerXAnchor.constraint(equalTo: button1.centerXAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            button3.centerXAnchor.constraint(equalTo: button2.centerXAnchor),
        ])
        
        button1.configurationUpdateHandler = { button in
            UIView.animate(withDuration: 0.1) {
                button.isHighlighted = false
                button.isUserInteractionEnabled = true
                button.transform = button.isTouchInside ? CGAffineTransform(scaleX: 0.94, y: 0.94) : CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
        
        button2.configurationUpdateHandler = { button in
            UIView.animate(withDuration: 0.1) {
                button.isHighlighted = false
                button.isUserInteractionEnabled = true
                button.transform = button.isTouchInside ? CGAffineTransform(scaleX: 0.94, y: 0.94) : CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
        
        button3.addTarget(self, action: #selector(presentModalVC), for: .touchUpInside)
    }
    
    @objc private func presentModalVC() {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        button1.backgroundColor = .systemGray2
        button2.backgroundColor = .systemGray2
        button3.backgroundColor = .systemGray2
        button1.titleLabel?.textColor = .systemGray3
        button2.titleLabel?.textColor = .systemGray3
        button3.titleLabel?.textColor = .systemGray3
        present(vc, animated: true)
    }
}

