//
//  SessionManager.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 09/08/23.
//

import Foundation
import MVVMLightSwift

class SessionManager : BaseService, ObservableObject {
    
    required init(){
        super.init()
        self.registerSingleton()
        InstanceLocator<LocalStorage>.instance.registerSingleton()
    }
    
}
