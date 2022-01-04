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
    private let user = "user"
    private let password = "password"
        
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.user = user
    }
    //MARK: - IBActions
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user || passwordTextField.text != password {
            showAlert(title: "Не правильный логин или пароль", message: "Пожалуйста введите правильный логин и пароль", textField: passwordTextField)
        }
        
    }
    
    @IBAction func forgotRegistrationData(_ sender: UIButton){
        sender.tag == 0
        ? showAlert(title: "Упс", message: "Ваш логин: \(user)")
        : showAlert(title: "Упс", message: "Ваш пароль: \(password)")
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

