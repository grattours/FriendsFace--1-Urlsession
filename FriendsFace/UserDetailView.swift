//
//  UserDetailView.swift
//  FriendsFace
//
//  Created by Luc Derosne on 22/11/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            Text("\(self.user.name)")
                .font(.largeTitle)
            Text(" \(self.user.email), \(self.user.company)")
            Text(self.user.address)
            Text("\(self.user.age.description) ans")
            Text("actif: \(self.user.isActive.description)")                              
            Text(self.user.registered)
            Text(self.user.about)
            
            
        }
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView()
//        let user = User(id: "1", isActive: false, name: "John Appleseed", age: 21, company: "Apple", email: "johnappleseed@apple.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.\r\n")
//            //, registered: <#T##String#>, tags: <#T##[String]#>, friends: <#T##[User.Friend]#>)
//
//        return UserDetailView(user: user)
//    }
//}
