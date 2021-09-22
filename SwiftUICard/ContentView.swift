//
//  ContentView.swift
//  SwiftUICard
//

import SwiftUI

struct ContentView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
     
    var body: some View {
        NavigationView{
            ScrollView{
                
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(0..<20) { num in
                            GeometryReader { proxy in
                                
                                NavigationLink(destination: Image("kvp"),
                                               label: {
                                    VStack{
                                        let scale = getScale(proxy: proxy)
                                        
                                        Image("kvp")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150)
                                            .clipped()
                                            .cornerRadius(5)
                                            .shadow(radius: 5)
                                            .scaleEffect(CGSize(width: scale, height: scale))
                                            //.overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5))
                                            .animation(.easeOut(duration:0.5))
                                        
                                        Text("Kurtlar Vadisi")
                                            .padding(.top)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(.label))
                                    }
                                    })
        

                            }
                            .frame(width: 125, height: 300)
                        }
                    }.padding(32)
                }

            }.navigationTitle("Movies Carousel")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
