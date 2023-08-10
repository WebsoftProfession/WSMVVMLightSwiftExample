//
//  ContentViewModel.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 08/08/23.
//

import Foundation
import MVVMLightSwift

final class ContentViewModel: BaseViewModel {
    
    @Published var employee: Employee!
    @Published var pushToEmployees:Bool = false
    
    var isFormValid: Bool {
        !(employee.name.isEmpty || employee.email.isEmpty)
    }
    
    override func onLoad() {
        super.onLoad()
        employee = Employee(name: "", email: "")
    }
    
    func addEmployee(){
        if isFormValid {
            var addedEmployees = InstanceLocator<LocalStorage>.singletonInstance.getValue(forKey: kEmployees, type: [Employee].self) ?? []
            addedEmployees.append(employee)
            InstanceLocator<LocalStorage>.singletonInstance.saveValue(key: kEmployees, value: addedEmployees, type: [Employee].self)
            self.resetForm()
        }
    }
    
    private func resetForm(){
        employee =  Employee(name: "", email: "")
    }
    
    
}
