//
//  AddView.swift
//  TodoList
//
//  Created by Daniil Antsyferov on 14/8/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject var viewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .cornerRadius(10)
                
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })

            }
            .padding(16)
        }
        .navigationTitle("Add an item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if validateText() {
            viewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
            alertTitle = "Add more text"
        }
        
    }
    
    func validateText() -> Bool {
        return textFieldText.count > 2
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
    
}
