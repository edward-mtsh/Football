//
//  BusyIndicator.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

var activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)

extension UIViewController {
 
    func showBusyView() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityView.center = self.view.center
        activityView.color = UIColor.red
        activityView.startAnimating()
        self.view.addSubview(activityView)
        self.placeAtCenter(view: activityView)
        activityView.center = CGPoint( x: (UIScreen.main.bounds.width / 2), y: (UIScreen.main.bounds.height / 2))
    }
    
    func hideBusyView() {
        UIApplication.shared.endIgnoringInteractionEvents()
        activityView.stopAnimating()
        activityView.isHidden = true
        activityView.removeFromSuperview()
    }
    
    func placeAtCenter(view: UIView) {
        self.view.addConstraint(NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
}
