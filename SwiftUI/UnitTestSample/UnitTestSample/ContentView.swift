//
//  ContentView.swift
//  UnitTestSample
//
//  Created by home on 17/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var user=""
    @State private var password=""
    @State private var activate=false;
    @State private var alertActive = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Log In")
                .font(.title)
            
            TextField("username",text: $user)
                .textCase(.lowercase)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                )
            
            SecureField("Password", text: $password)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                )
            
            Button("Continue", action: validateAccess)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
            
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
        .alert(isPresented: $alertActive) {
            Alert(title: Text("Invalid Login"),
                  message: Text("Your login credential were incorrect\nTry Again."),                                dismissButton: .default(
                    Text("Dismiss"))
            )
        }
        .sheet(isPresented: $activate) {
            VStack(spacing:40)
            {
                Spacer()
                Text("Welcome")
                Button("Close"){activate=false}
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
    func validateAccess(){
        if user == "ramonfe" && password == "password"{
            activate=true
        }else{alertActive=true}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
