//
//  UIButton.swift
//  BSZoomGridScrollViewSwiftUIExample
//
//  Created by Seoksoon Jang on 2019/11/19.
//  Copyright © 2019 Seoksoon Jang. All rights reserved.
//

import UIKit

@objc private class ClosureBox: NSObject {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func take(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let container = ClosureBox(closure)
        addTarget(container, action: #selector(ClosureBox.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", container, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
