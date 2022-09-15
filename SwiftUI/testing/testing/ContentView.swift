//
//  ContentView.swift
//  testing
//
//  Created by home on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var txt1 = ""
    var body: some View {
        VStack{
            TextField("some",text: $txt1)
            TextField("some",text: $txt1)
            TextField("some",text: $txt1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
