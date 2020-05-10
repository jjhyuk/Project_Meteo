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

//protocol ResultBuilder<T> {
//    associatedtype T
//
//    func setContent(_ content:T) -> ResultBuilder
//    func setErrorCode() -> ResultBuilder
//    func setErrorMessage() -> ResultBuilder
//}

class TestResult<T> {
    
    var content:T?
    var errorCode:Int?
    var errorMessage:String?
    

    func setContent(content:T?) -> TestResult{
        self.content = content
        return self
    }
    func setErrorCode(errorCode:Int? = nil) -> TestResult {
        self.errorCode = errorCode
        return self
    }
    func setErrorMessage(errorMessage:String? = nil) -> TestResult {
        self.errorMessage = errorMessage
        return self
    }
}

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
        
        
        self.withEscaping("aaaa") { (text) in
            print(text);
        }
        
        var a:Array = ["a","ab","abc"]
        self.withGenericEscaping("thisisGeneric") { callback in
            print(callback.content)
            print(callback.errorCode)
        }
        
        self.withGenericEscaping("aaa") { (result) in
            print(result.content)
        }
        
        var aaa : TestResult<Bool> = TestResult()
        aaa.setContent(content: true)
            .setErrorCode(errorCode: 2)
            .setErrorMessage()
        
//        print(aaa.content)
//        print(aaa.errorCode)
//        print(aaa.errorMessage)
    }
    
    func bindUI() {
        self.EmailLabel.rx.text.orEmpty.subscribe(
            onNext: { (text) in
                self.loginViewModel.setEmail(text)
            }
        )
        
        loginViewModel.IsEmailValid.bind(to: self.siginBtn.rx.isEnabled).disposed(by: disposeBag)
    }
    
    func withEscaping(_ text:String, completion: @escaping (String) -> Void) {
        // 함수 밖에 있는 completionHandlers 배열에 해당 클로저를 저장
        completion(text)
    }
    
    func withGenericEscaping(_ text:String, completion: @escaping (TestResult<String>) -> Void) {
        
        var callback: TestResult<String> = TestResult()
        callback.setContent(content: text)
            
        print(text)
        
        completion(callback)
    }
    
}

