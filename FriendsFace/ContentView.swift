//
//  ContentView.swift
//  FriendsFace
//
//  Created by Luc Derosne on 22/11/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

extension User {
    struct Friend: Codable {
        let id: String
        let name: String
    }
}



struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            Section {
                List(users) { item in
                    
                    VStack(alignment: .leading) {
                        NavigationLink(destination: UserDetailView(user: item)) {
                            VStack(alignment: .leading) {
                                Text("Nom : \(item.name) \(item.age) ans")
                                    .font(.headline)
                                // Text("\(item.age) ans")
                                Text("Entreprise : \(item.company)")
                            }
                        }
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("FriendsFaces")
        }
        
    }
}

extension ContentView {
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
