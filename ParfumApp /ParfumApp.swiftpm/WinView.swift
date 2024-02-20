//
//  WinView.swift
//  ParfumApp
//
//  Created by Christian Carvalho on 05/02/24.
//

import SwiftUI

struct WinView: View {
    @State private var changeScreen = false
    var body: some View {
        
        GeometryReader { geometry in
            
            Image("caixaWinNew")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
            
                
            Button(action: {
                self.changeScreen = true
            }) {
                
                Image("botaoCima")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                    .overlay{
                        Text("Title Screen")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 35)))
                            
                    }
                    .frame(alignment: .center)
                    .frame(maxWidth: .infinity)
                
            }
            .frame(alignment: .center)
            .frame(maxWidth: .infinity)
                
            }
            .fullScreenCover(isPresented: $changeScreen) {
                ContentView()
            }
        }
    }

#Preview {
    WinView()
}
