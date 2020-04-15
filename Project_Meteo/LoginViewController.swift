//
//  ViewController.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/13.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class LoginViewController: UIViewController {
    
    @IBOutlet weak var EmailLabel: DesignableUITextField!
    @IBOutlet weak var PasswordLabel: DesignableUITextField!
    
    @IBOutlet weak var siginBtn: DesignableUIButton!
    @IBOutlet weak var registerBtn: DesignableUILabel!
    
    var loginViewModel = LoginViewModel();
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bindUI()
        
//        self.EmailLabel.rx.text
//            .orEmpty
//            .map(self.ChekcValidateWithEamil)
//            .bind(to: self.siginBtn.rx.isEnabled)
//            .disposed(by: disposeBag)

//        self.EmailLabel.rx.text
//        .orEmpty
//        .map(self.ChekcValidateWithEamil)
//        .subscribe(onNext: { (isTrue) in
//                self.siginBtn.isEnabled = isTrue
//            }
//        )
        
    }
    
    func bindUI() {
        self.EmailLabel.rx.text.orEmpty.subscribe(
            onNext: { (text) in
                self.loginViewModel.setEmail(text)
            }
        )
        
        loginViewModel.IsEmailValid.bind(to: self.siginBtn.rx.isEnabled).disposed(by: disposeBag)
    }

}

