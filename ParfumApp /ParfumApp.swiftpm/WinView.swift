//
//  WinView.swift
//  ParfumApp
//
//  Created by Christian Carvalho on 05/02/24.
//

import SwiftUI

struct WinView: View {
    var body: some View {
        GeometryReader { geometry in
            
            Image("caixaWin")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
            
            
        }
    }
}

#Preview {
    WinView()
}
