//
//  ContentView.swift
//  Training
//
//  Created by home on 06/09/22.
//

import SwiftUI

struct Posts: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct ContentView: View {
    @State private var posts = [Posts]()
    
    var body: some View {
        NavigationView{
            VStack{
                List(posts, id: \.id) { post in
                    NavigationLink(post.title){
                        VStack{
                            Text(post.body )
                            Spacer()
                        }
                    }
                }
                Button("Save File"){
                    save()
                }
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            }
            .navigationTitle("Posts")
        }
        .task {
            //await getData()
        }
        .onAppear(perform: load)
    }
   
    func save(){
        let pathFile = FileManager.documentDirectory.appendingPathComponent("SaveData")
        
        if let data = try? JSONEncoder().encode(posts){
            do{
                try data.write(to: pathFile, options: .atomic)
                print("data saved \(data)")
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    
    func load(){
        let pathFile = FileManager.documentDirectory.appendingPathComponent("SaveData")
        
        if let data = try? Data(contentsOf: pathFile){
            if let decoded = try? JSONDecoder().decode([Posts].self, from: data){
                posts = decoded
                print("loaded from file")
            }
        }
    }
    
    func getData() async{
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode([Posts].self, from: data){
                posts = decodedData
            }
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
