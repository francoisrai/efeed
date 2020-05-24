//
//  MsgService.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/24.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import Foundation
import UIKit

final class MsgService {
    static func displayInfo(title:String, msg: String, vc: UIViewController) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
