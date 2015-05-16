//
//  SignInViewController.swift
//  Carousel2
//
//  Created by Mike Jacobs on 5/13/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var groupView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var buttonGroup: UIView!
    
    var correctEmail = "e"
    var correctPassword = "p"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groupView.transform = CGAffineTransformMakeScale(0.8, 0.8)
        groupView.transform = CGAffineTransformTranslate(groupView.transform, 0, 10)
        groupView.alpha = 0
        
        UIView.animateWithDuration(0.3){
            self.groupView.transform = CGAffineTransformMakeScale(1, 1)
            self.groupView.alpha = 1
            self.groupView.transform = CGAffineTransformTranslate(self.groupView.transform, 0, 0)
        }
        
        var center: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func didPressSignInButton(sender: AnyObject) {
        if emailField.text.isEmpty || passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Sign In Failed", message: "Please enter an email and password.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            delay(2){
                if
                    self.emailField.text == self.correctEmail && self.passwordField.text == self.correctPassword {
                        alertView.dismissWithClickedButtonIndex(0, animated: true)
                        self.performSegueWithIdentifier("welcomeSegue", sender: nil)
                } else {
                    alertView.dismissWithClickedButtonIndex(0, animated: true)
                    var alertView2 = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password.", delegate: self, cancelButtonTitle: "OK")
                    alertView2.show()
                    
                }
            }
        }
        
    }
    
    @IBAction func onTapView(sender: AnyObject) {
        println("tapped on view")
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.groupView.frame.origin.y -= 100
            self.buttonGroup.frame.origin.y  -= 260
        })
    }
    func keyboardWillHide(notification: NSNotification) {
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.groupView.frame.origin.y += 100
            self.buttonGroup.frame.origin.y  += 260
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
