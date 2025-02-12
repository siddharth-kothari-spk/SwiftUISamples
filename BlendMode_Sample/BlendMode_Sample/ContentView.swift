//
//  ContentView.swift
//  BlendMode_Sample
//
//  Created by Siddharth Kothari on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Normal")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.normal)
                }.padding()
                
                HStack {
                    Text("Multiply")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.multiply)
                }.padding()
                
                HStack {
                    Text("Screen")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.screen)
                }.padding()
                
                HStack {
                    Text("Overlay")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.overlay)
                }.padding()
                
                HStack {
                    Text("Darken")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.darken)
                }.padding()
                
                HStack {
                    Text("Lighten")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.lighten)
                }.padding()
                
                HStack {
                    Text("ColorDodge")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.colorDodge)
                }.padding()
                
                HStack {
                    Text("ColorBurn")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.colorBurn)
                }.padding()
                
                HStack {
                    Text("SoftLight")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.softLight)
                }.padding()
                
                HStack {
                    Text("HardLight")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.hardLight)
                }.padding()
                
                HStack {
                    Text("Difference")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.difference)
                }.padding()
                
                HStack {
                    Text("Exclusion")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.exclusion)
                }.padding()
                
                HStack {
                    Text("Hue")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.hue)
                }.padding()
                
                HStack {
                    Text("Saturation")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.saturation)
                }.padding()
                
                HStack {
                    Text("Color")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.color)
                }.padding()
                
                HStack {
                    Text("Luminosity")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.luminosity)
                }.padding()
                
                HStack {
                    Text("SourceAtop")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.sourceAtop)
                }.padding()
                
                HStack {
                    Text("DestinationOver")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.destinationOver)
                }.padding()
                
                HStack {
                    Text("DestinationOut")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.destinationOut)
                }.padding()
                
                HStack {
                    Text("PlusDarker")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.plusDarker)
                }.padding()
                
                HStack {
                    Text("PlusLighter")
                        Color.yellow.frame(width: 100, height: 100, alignment: .center)
               
                        Color.red.frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            .blendMode(.plusLighter)
                }.padding()
               
                if #available(iOS 18.0, *) {
                    HStack {
                        // public func mix(with rhs: Color, by fraction: Double, in colorSpace: Gradient.ColorSpace = .perceptual) -> Color usage

                        Rectangle()
                            .frame(width: 50, height: 50)
                            .clipShape(.rect(cornerRadius: 10))
                            .foregroundStyle(.red)
                        
                        Text("+")
                            .frame(width: 20, height: 20)
                            .bold()
                        
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .clipShape(.rect(cornerRadius: 10))
                            .foregroundStyle(.blue)
                        
                        Text("=")
                            .frame(width: 20, height: 20)
                            .bold()
                        
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .clipShape(.rect(cornerRadius: 10))
                            .foregroundStyle(.red.mix(with: .blue, by: 0.5, in: .device))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
