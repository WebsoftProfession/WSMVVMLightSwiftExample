//
//  ContentView.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 08/08/23.
//

import SwiftUI
import MVVMLightSwift

struct ContentView<T: ContentViewModel>: BaseView {
    
    @ObservedObject var viewModel = bindingViewModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Add New Employee")
                }
                VStack {
                    
                    TextField(text: self.$viewModel.employee.name, axis: .horizontal) {
                        Text("Enter full name").foregroundColor(.gray)
                    }
                    .multilineTextAlignment(.leading).frame(minHeight: 40)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                    )
                }
                
                VStack {
                    
                    TextField(text: self.$viewModel.employee.email, axis: .horizontal) {
                        Text("Enter email address").foregroundColor(.gray)
                    }
                    .multilineTextAlignment(.leading).frame(minHeight: 40)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                    )
                }
                
                VStack {
                    HStack(spacing: 20.0) {
                        Button(action: {
                            self.viewModel.addEmployee()
                        }) {
                            HStack {
                                Spacer()
                                Text("Add").padding(EdgeInsets(top: 15, leading: 10,
                                                               bottom: 15, trailing: 10)).foregroundColor(.white)
                                Spacer()
                            }.background(.gray).mask(RoundedRectangle(cornerRadius: 5)).overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.clear)
                            )
                        }
                        
                        Button(action: {
                            self.viewModel.pushToEmployees = true
                        }) {
                            HStack {
                                Spacer()
                                Text("Employee List").padding(EdgeInsets(top: 15, leading: 10,
                                                               bottom: 15, trailing: 10)).foregroundColor(.white)
                                Spacer()
                            }.background(.gray).mask(RoundedRectangle(cornerRadius: 5)).overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.clear)
                            )
                        }
                    }
                    
                }
            }
            .padding()
        }.navigationDestination(
            isPresented: self.$viewModel.pushToEmployees) {
                
                EmployeesView()
//                EmployeesContainerViewController()
                

            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
