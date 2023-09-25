//
//  ContentView.swift
//  Polling Sample
//
//  Created by Siddharth Kothari on 25/09/23.
//
// courtsey : https://medium.com/@abdulkarimkhaan/implementing-polling-in-swiftui-63b77b1cf1f6

import SwiftUI

struct ContentView: View {
    @ObservedObject private var pollingManager = PollingManager<String>(pollingInterval: 2.0)
    @State var numberOfTimePolled = 0
    
    var body: some View {
        VStack {
            Text("Polling Example").padding()
            Text("\(numberOfTimePolled)").padding()
            Button("Stop polling") {
                print("Polling stopped")
                pollingManager.stopPolling()
            }.padding()
            Button("Start polling") {
                pollingManager.startPolling {
                    self.pollingAction()
                }
            }.padding()
        }.onAppear {
            pollingManager.startPolling {
                self.pollingAction()
            }
        }.onDisappear {
            pollingManager.stopPolling()
        }.padding()
    }
    
    func pollingAction() {
            // Perform your polling logic here
            print("Polling...")
            numberOfTimePolled += 1
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
