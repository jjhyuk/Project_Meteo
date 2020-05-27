//
//  MeteoRequest.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/05/27.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import Alamofire

class MeteoRequest {
    
    private var url: String
    private var parameter: Dictionary<String,String>?
    private var header: Dictionary<String,String>?
    private var body: Dictionary<String,String>?
    
    init(url:String) {
        self.url = url
    }
    
    @discardableResult
    public func setParameters(withDictinary parameter:Dictionary<String,String>) -> MeteoRequest {
        
        if self.parameter == nil {
            self.parameter = Dictionary()
        }
        
        self.parameter?.merge(parameter, uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    @discardableResult
    public func setParameters(withKey key:String,value value:String) -> MeteoRequest {
        
        if self.parameter == nil {
            self.parameter = Dictionary()
        }
        
        self.parameter?.merge([key : value], uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    @discardableResult
    public func setAuthorization(withValue authorization:String) -> MeteoRequest {
        
        if self.header == nil {
            self.header = Dictionary()
        }
        
        self.header?.merge(["Authorization" : authorization], uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    public func setHeader(withDictinary hearder:Dictionary<String,String>) -> MeteoRequest {
        
        if self.header == nil {
            self.header = Dictionary()
        }
        
        self.header?.merge(hearder, uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    @discardableResult
    public func setHeader(withKey key:String,value value:String) -> MeteoRequest {
        
        if self.header == nil {
            self.header = Dictionary()
        }
        
        self.header?.merge([key : value], uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    @discardableResult
    public func setBody(withDictinary body:Dictionary<String,String>) -> MeteoRequest {
        
        if self.body == nil {
            self.body = Dictionary()
        }
        
        self.body?.merge(body, uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    @discardableResult
    public func setBody(withKey key:String,value value:String) -> MeteoRequest {
        
        if self.body == nil {
            self.body = Dictionary()
        }
        
        self.body?.merge([key : value], uniquingKeysWith: { (origin, new) -> String in
            new
        })
        
        return self
    }
    
    public func get(success: @escaping (AnyObject) -> Void,failure: @escaping (Error) -> Void) {
        
        AF.request(self.url, method: .get, headers: (self.header != nil) ? HTTPHeaders.init(self.header!) : nil)
            .debugLog()
            .validate()
            .responseJSON { (JSON) in
                
                switch JSON.result {
                    
                case .success(let data):
                    
                    MeteoLog(data)
                    //MeteoResult 객체로 변환해서 사용
                    //let result: MeteoResult = try! JSONDecoder().decode(MeteoResult.self, from: try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted))
                    
                    success(data as AnyObject)
                    break
                    
                case .failure(let error):
                    
                    failure(error as Error)
                    break
                }
                
        }
    }
    
    public func post(success: @escaping (AnyObject) -> Void, failure: @escaping (Error) -> Void) {
        

        AF.request(self.url, method: .post, headers: (self.header != nil) ? HTTPHeaders.init(self.header!) : nil)
            .debugLog()
            .validate()
            .responseJSON { (JSON) in
                
                switch JSON.result {
                    
                case .success(let data):
                    
                    MeteoLog(data)
                    success(data as AnyObject)
                    break
                    
                case .failure(let error):
                    
                    failure(error as Error)
                    break
                }
                
        }
    }
    
}
