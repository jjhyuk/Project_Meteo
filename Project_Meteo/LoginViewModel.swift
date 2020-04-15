//
//  LoginViewModel.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/04/15.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import RxSwift


protocol LoginViewModelType {
    var isLoginSuccess: ReplaySubject<Bool> { get }
}

class LoginViewModel {
    
    var IsEmailValid = PublishSubject<Bool>()
    
    func setEmail(_ Email: String) {
        IsEmailValid.onNext(ChekcValidateWithEamil(Email))
    }
    
    func ChekcValidateWithEamil(_ Email:String) -> Bool {
        print("EmailCount : \(Email.count)")
        guard  Email.count > 10 else { return false }
        
        return true
        
    }
    
}
