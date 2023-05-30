//
//  ContentView.swift
//  Navigation_Stack_Update
//
//  Created by Shreyas on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var platforms : [Platform] = [
        .init(name: "xbox", imageName: "xbox.logo", color: .green),
        .init(name: "Playstation", imageName: "playstation.logo", color: .blue),
        .init(name: "PC", imageName: "pc", color: .pink),
        .init(name: "Mobile", imageName: "iphone", color: .green)
    ]
    
    var games : [Game] = [
        .init(name: "Minecraft", rating:"98"),
        .init(name: "God of War", rating: "99"),
        .init(name: "Fortnite", rating: "100"),
    ]
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path:$path){
            List{
                Section("Platform"){
                    ForEach(platforms, id: \.name){platform in
                        NavigationLink(value: platform){
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
                
                Section("Game"){
                    ForEach(games, id:\.name) { game in
                        NavigationLink(value: game){
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self){ platform in
                ZStack{
                    platform.color.ignoresSafeArea()
                    VStack{
                        Label(platform.name, systemImage: platform.imageName)
                            .font(.largeTitle).bold()
                        List{
                            ForEach(games, id:\.name) { game in
                                NavigationLink(value: game){
                                    Text(game.name)
                                }
                            }
                        }
                    }
                }
            }
            
            .navigationDestination(for: Game.self){ game in
                VStack(spacing:20){
                    Text("\(game.name) - \(game.rating)")
                        .font(.largeTitle).bold()
                    
                    Button("Recommended Game"){
                        path.append(games.randomElement()!)
                    }
                    Button("Recommended platform"){
                        path.append(platforms.randomElement()!)
                    }
                    Button("Go Home"){
                        path.removeLast(path.count)
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Platform: Hashable{
    let name: String
    let imageName: String
    let color: Color
}


struct Game: Hashable{
    let name: String
    let rating: String
}
