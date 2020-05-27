//
//  Bundle+Meteo.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/05/27.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation

extension Bundle {
    
    internal static func MeteoBundle() -> Bundle {
        //산출물인 app파일의 경로
        //var path = Bundle.main.bundlePath
        MeteoLog()
        
        //여기는 Dynamic Framework 생성시 번들 위치 찾는 방법
        let Bundle_Name = "번들이름을 넣어주세요"
        
        var path = Bundle.init(for: Meteo.self).bundlePath
        
        
        path.append(Bundle_Name)
        
        let bundle = Bundle.init(path: path)!
        
        return bundle
    }
}

