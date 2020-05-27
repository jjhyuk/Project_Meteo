//
//  DataRequest+Logging.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/05/27.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    
    public func debugLog() -> DataRequest {
        
        //이쁘게 보이게 바꿔야됨
        MeteoLog(self.description)
        
        return self
    }
}
