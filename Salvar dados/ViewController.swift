//
//  ViewController.swift
//  Salvar dados
//
//  Created by Edwy Lugo on 22/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let key = "minhasAnotacoes"
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func buttonSave(_ sender: Any) {
        
        if let texto = textView.text {
            UserDefaults.standard.set("\(texto)", forKey: key)
        }
        
        // create the alert
        let alert = UIAlertController(title: "Minhas anotações", message: "Texto salvo com sucesso", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = recuperarAnotacao()
    
    }
    
    func recuperarAnotacao() -> String {
        //recuperar dados defaults
        if let texto = UserDefaults.standard.object(forKey: key) {
            return "\(texto)"
        }
        
        return ""
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    


}

