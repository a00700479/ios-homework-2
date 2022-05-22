//
//  UIView+Extension.swift
//  Navigation
//
//  Created by Natali on 27.04.2022.
//

import UIKit

extension UIView {

    static var identifier: String {
        return String(describing: self) 

    }
}

extension UIView {

    func trigger(count: Float = 5, for duration: TimeInterval = 0.3, withTranslation translation: Float = 4) {
let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }

}


