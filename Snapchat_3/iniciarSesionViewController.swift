//
//  iniciarSesionViewController.swift
//  Snapchat_3
//
//  Created by Cafu Aguilar on 5/30/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func iniciarSesionTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user,error) in
            print("Intentamos iniciar sesión")
            if error != nil{
                print("Tenemos el siguiente error:\(error)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user,error) in
                    print("Intentamos crear usuario")
                    if error != nil{
                        print("Tenemos el siguiente error:\(error)")
                    }else{
                        print("El usuario fue creado satisfactoriamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Inicio de sesión exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }
}

