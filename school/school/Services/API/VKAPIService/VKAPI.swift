//
//  VKAPI.swift
//  school
//
//  Created by Данила Парамин on 09.08.2022.
//

import Foundation
import Moya

var viewModel = GroupViewModel()

enum VKAPI {
    case getGroups
   
}

extension VKAPI: TargetType {
    
    var baseURL: URL {
        viewModel.url!
    }
    
    var path: String {
        ""
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        [:]
    }
}

