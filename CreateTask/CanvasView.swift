//
//  CanvasView.swift
//  CreateTask
//
//  Created by Winsor, Orion on 11/22/22.
//

import SwiftUI
import SpriteKit

struct CanvasView: View
{
    let width : CGFloat = 300
    let height : CGFloat = 500
    
    private var simpleScene : Physics
    {
        let scene = Physics()
        scene.size = CGSize(width: width, height: height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View
    {
        VStack
        {
            Text("Sand Drop")
            SpriteView(scene: simpleScene)
                .frame(maxWidth: UIDevice.current.userInterfaceIdiom != .pad ? width: .infinity, maxHeight: UIDevice.current.userInterfaceIdiom != .pad ? height : .infinity)
        }
        .padding()
    }
}

struct CanvasView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CanvasView()
    }
}
