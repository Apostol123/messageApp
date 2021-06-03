//
//  MessageAppThemeColors.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import UIKit

enum MessageAppThemeColors {
    case messageAppDefaultPurple
}

extension UIColor {
   static func theme(identifier: MessageAppThemeColors) -> UIColor {
        switch identifier {
        case .messageAppDefaultPurple:
            return .purple
        }
    }
}
