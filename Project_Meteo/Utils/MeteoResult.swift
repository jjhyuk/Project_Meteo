//
//  MeteoResult.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/05/27.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation

internal class MeteoResult: NSObject {
    
    //완성된 코드는 아니지만 안드로이드와 콜백구조를 동일하게 갈수있음 Generic
    //ObjC에선 Generic을 지원하지않기에 프레임워크 내부에서 쓰지않는 이상 사용할수 없음

    //private var content:T?
    private var errorCode:Int?
    private var errorMessage:String?
    
    var error:Dictionary<String, AnyObject>?
    var result:Dictionary<String, AnyObject>?
    var status:Int?
    
    enum MeteoResultCodingKeys:String, CodingKey {
        case status = "status"
        case result = "result"
        case error = "error"
    }

//  Decodable Protocol 채택해야함.
//  Coding Key를 사용하기 위해선 멤버변수들이 형태가 정해져있어야함. Generic은 사용할수 없음 
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: MeteoResultCodingKeys.self)
//
//        self.error = try? container.decode(Dictionary.self, forKey: .error)
//        self.result = try? container.decode(Dictionary.self, forKey: .result)
//        self.status = try? container.decode(Int.self, forKey: .status)
//    }
    
//    override var description: String {
//        return [MeteoResultCodingKeys.status.rawValue : self.status, MeteoResultCodingKeys.result.rawValue : self.result, MeteoResultCodingKeys.error.rawValue : self.error].description
//    }
    
    public func setErrorCode(errorCode:Int? = nil) -> MeteoResult {
        self.errorCode = errorCode
        return self
    }
    
    public func setErrorMessage(errorMessage:String? = nil) -> MeteoResult {
        self.errorMessage = errorMessage
        return self
    }
    
}

