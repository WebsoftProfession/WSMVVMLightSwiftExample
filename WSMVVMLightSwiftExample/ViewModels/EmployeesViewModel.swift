//
//  EmployeesViewModel.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 09/08/23.
//

import Foundation
import MVVMLightSwift

final class EmployeesViewModel: BaseViewModel {
    
    @Published var employess: [Employee] = []
    
    override func onLoad() {
        super.onLoad()
        employess = InstanceLocator<LocalStorage>.singletonInstance.getValue(forKey: kEmployees, type: [Employee].self) ?? []
    }
    
}
