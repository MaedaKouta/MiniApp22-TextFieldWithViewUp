//
//  ViewController.swift
//  MiniApp22-TextFieldWithViewUp
//
//  Created by 前田航汰 on 2022/03/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        let noneMoveHeight = view.frame.origin.y + view.frame.size.height - keyboardSize.height

        if noneMoveHeight <= textField.frame.midY {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height
            } else {
                let gapHeight = view.frame.origin.y + keyboardSize.height
                view.frame.origin.y -= gapHeight
            }
        } else {
            print("キーボードを動かす必要なし")
        }
}

    @objc func keyboardWillHide() {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }

}
