//
//  ViewController.swift
//  Concentration
//
//  Created by Caleb Wells on 11/15/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardOneButton: UIButton = {
        let card = UIButton()
        card.setTitle("🤯", for: .normal)
        card.titleLabel?.font = .systemFont(ofSize: 72)
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.layer.masksToBounds = true
        card.translatesAutoresizingMaskIntoConstraints = false
        card.widthAnchor.constraint(equalToConstant: 120).isActive = true
        card.heightAnchor.constraint(equalToConstant: 160).isActive = true
        card.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
        return card
    }()
    
    let cardTwoButton: UIButton = {
        let card = UIButton()
        card.setTitle("👻", for: .normal)
        card.titleLabel?.font = .systemFont(ofSize: 72)
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.layer.masksToBounds = true
        card.translatesAutoresizingMaskIntoConstraints = false
        card.widthAnchor.constraint(equalToConstant: 120).isActive = true
        card.heightAnchor.constraint(equalToConstant: 160).isActive = true
        card.addTarget(self, action: #selector(touchSecondCard), for: .touchUpInside)
        return card
    }()
    
    let cardThreeButton: UIButton = {
        let card = UIButton()
        card.setTitle("🤬", for: .normal)
        card.titleLabel?.font = .systemFont(ofSize: 72)
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.layer.masksToBounds = true
        card.translatesAutoresizingMaskIntoConstraints = false
        card.widthAnchor.constraint(equalToConstant: 120).isActive = true
        card.heightAnchor.constraint(equalToConstant: 160).isActive = true
        card.addTarget(self, action: #selector(touchThirdCard), for: .touchUpInside)
        return card
    }()
    
    let cardFourButton: UIButton = {
        let card = UIButton()
        card.setTitle("🎃", for: .normal)
        card.titleLabel?.font = .systemFont(ofSize: 72)
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.layer.masksToBounds = true
        card.translatesAutoresizingMaskIntoConstraints = false
        card.widthAnchor.constraint(equalToConstant: 120).isActive = true
        card.heightAnchor.constraint(equalToConstant: 160).isActive = true
        card.addTarget(self, action: #selector(touchFourthCard), for: .touchUpInside)
        return card
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUpCardsLayout()
    }
    
    func setUpCardsLayout() {
        view.addSubview(cardOneButton)
        view.addSubview(cardTwoButton)
        view.addSubview(cardThreeButton)
        view.addSubview(cardFourButton)
        
        let topCardsStackView = UIStackView(arrangedSubviews: [cardOneButton, cardTwoButton])
        topCardsStackView.translatesAutoresizingMaskIntoConstraints = false
        topCardsStackView.distribution = .equalSpacing
        view.addSubview(topCardsStackView)
        
        let bottomCardsStackView = UIStackView(arrangedSubviews: [cardThreeButton, cardFourButton])
        bottomCardsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomCardsStackView.distribution = .equalSpacing
        view.addSubview(bottomCardsStackView)
        
        topCardsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        topCardsStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        topCardsStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -50).isActive = true
        topCardsStackView.bottomAnchor.constraint(equalTo: bottomCardsStackView.topAnchor, constant: -300).isActive = true
        
        bottomCardsStackView.topAnchor.constraint(equalTo: topCardsStackView.bottomAnchor, constant: 300).isActive = true
        bottomCardsStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bottomCardsStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -50).isActive = true
        bottomCardsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
    }
    
    @objc func touchCard() {
        flipCard(withEmoji: "🤯", on: cardOneButton)
    }
    
    @objc func touchSecondCard() {
        flipCard(withEmoji: "👻", on: cardTwoButton)
    }
    
    @objc func touchThirdCard() {
        flipCard(withEmoji: "🤬", on: cardThreeButton)
    }
    
    @objc func touchFourthCard() {
        flipCard(withEmoji: "🎃", on: cardFourButton)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6425891288, blue: 0.2804650337, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

