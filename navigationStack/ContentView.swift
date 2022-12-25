//
//  ContentView.swift
//  navigationStack
//
//  Created by Soner Karaevli on 25.12.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: Creating Navigation Stack
    // Where You can Push And Pop Views
    @State var mainStack: [NavigationType] = []
    var body: some View {
       // MARK: Complex Structure
        NavigationStack(path: $mainStack){
            TabView{
                Text("Home").tabItem {
                    Image(systemName: "house.fill")
                }
                Text("Search").tabItem {
                    Image(systemName: "magnifyingglass")
                }
                Text("Liked").tabItem {
                    Image(systemName: "suit.heart.fill")
                }
                Text("Settings").tabItem {
                    Image(systemName: "person.circle.fill")
                }
            }.navigationTitle("Instagram").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        mainStack.append(.dm)
                    } label: {
                        Image.init(systemName: "paperplane").font(.callout)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        mainStack.append(.camera)
                    } label: {
                        Image.init(systemName: "camera").font(.callout)
                    }
                }
            }
            // MARK: New API that Can Push New Based on DataType
            .navigationDestination(for: NavigationType.self) { value in
                // MARK: Push Your Views Based On Value
                switch value{
                case .camera: VStack{
                    Text("Camera View")
                    // if you want to pop just remove  last or which you need to remove frome stack
                    Button("Pop"){
                        mainStack.removeLast()
                    }
                    Button("Go to DM View"){
                        mainStack.append(.dm)
                    }

                }
                case .home: Text("Home View")
                case .dm : VStack{
                    Text("DM View")
                    Button("Pop"){
                        mainStack.removeLast()
                    }
                    Button("Pop To Root"){
                        mainStack.removeAll()
                    }
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

// MARK: Enum Case for Navigation Stack Items
enum NavigationType: String, Hashable{
    case dm = "DM VIEW"
    case camera = "CAMERA VIEW"
    case home = "HOME"
}
