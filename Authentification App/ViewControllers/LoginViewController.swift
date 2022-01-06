//
//  ViewController.swift
//  Authentification App
//
//  Created by Denis on 16.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Private properties
    private let user = User.getUserData()
        
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
    //MARK: - IBActions
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(title: "Не правильный логин или пароль", message: "Пожалуйста введите правильный логин и пароль", textField: passwordTextField)
        }
        
    }
    
    @IBAction func forgotRegistrationData(_ sender: UIButton){
        sender.tag == 0
        ? showAlert(title: "Упс", message: "Ваш логин: \(user.login)")
        : showAlert(title: "Упс", message: "Ваш пароль: \(user.password)")
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

//MARK: - Alert action
extension LoginViewController {
    private func showAlert (title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){_ in textField?.text = ""}
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - Keyboard
extension LoginViewController:UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}

