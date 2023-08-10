//
//  EmployeesView.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 10/08/23.
//

import SwiftUI
import MVVMLightSwift

struct EmployeesView<T: EmployeesViewModel>: BaseView {
    
    @ObservedObject var viewModel = bindingViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(self.viewModel.employess, id: \.email) { employee in
                    HStack {
                        Image(systemName: "person.circle.fill").resizable().frame(width: 50, height: 50).foregroundColor(.black)
                        VStack(alignment: .leading) {
                            Text(employee.name)
                            Text(employee.email).foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
                
            }.padding()
            
            
        }
    }
}

struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesView()
    }
}
