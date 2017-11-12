//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

let label: UILabel = {
    let label = UILabel()
    label.text = "Hello Playground!"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

func setUpLabelLayout() {
    label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    label.widthAnchor.constraint(equalToConstant: 200).isActive = true
    label.heightAnchor.constraint(equalToConstant: 100).isActive = true
}


PlaygroundPage.current.liveView = view

