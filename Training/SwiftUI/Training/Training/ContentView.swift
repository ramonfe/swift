//
//  ContentView.swift
//  Training
//
//  Created by home on 06/09/22.
//

import SwiftUI

struct Posts: Decodable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct ContentView: View {
    @State private var posts = [Posts]()
    
    var body: some View {
        NavigationView{
            List(posts, id: \.id) { post in
                Text(post.title)
            }
            .navigationTitle("Posts")
        }
        .task {
            await getData()
        }
    }
    
    func getData() async{
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([Posts].self, from: data)
           
                posts = decodedData
            
        }catch{
            print (error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
