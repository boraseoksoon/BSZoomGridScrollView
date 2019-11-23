//
//  UIViewController+Extension.swift
//  BSZoomGridScrollView
//
//  Created by Seoksoon Jang on 2019/11/19.
//

#if os(iOS)

import UIKit

extension UIViewController {
    func showToast(message : String, font: UIFont) {
        let toast = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75,
                                          y: self.view.frame.size.height-(self.view.frame.size.height * 0.3),
                                          width: 150,
                                          height: 50))
        toast.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        toast.textColor = UIColor.white
        toast.font = font
        toast.textAlignment = .center;
        toast.text = message
        toast.alpha = 1.0
        toast.layer.cornerRadius = 15;
        toast.clipsToBounds  =  true
        
        self.view.addSubview(toast)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toast.alpha = 0.0
        }, completion: { isCompleted in
            if isCompleted {
                toast.removeFromSuperview()
            }
        })
    }
}

#endif
