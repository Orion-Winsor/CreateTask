//
//  ContentView.swift
//  CreateTask
//
//  Created by Winsor, Orion on 11/22/22.
//

import SwiftUI
import SpriteKit

struct MainView: View
{
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color.purple
                    .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text ("SandBox Drop")
                        .font(Font.custom("Courier New Bold", size: 45))
                        .padding()
                    NavigationLink("Begin Game", destination: CanvasView())
                        .accessibilityValue("clicking shiould bring you to drawing view")
                }
            }
        .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MainView()
    }
}
