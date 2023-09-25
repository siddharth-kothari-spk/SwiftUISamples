//
//  PollingManager.swift
//  Polling Sample
//
//  Created by Siddharth Kothari on 25/09/23.
//

import Foundation

class PollingManager<T>: ObservableObject {
    let pollingInterval: TimeInterval
    private var pollingTimer: Timer?
    private var pollingAction: (() -> Void)?
    
    init(pollingInterval: TimeInterval) {
        self.pollingInterval = pollingInterval
    }
    
    func startPolling(pollingAction: @escaping () -> Void) {
        self.pollingAction = pollingAction
        
        self.pollingTimer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true, block: { _ in
            self.pollingAction?()
        })
    }
    
    func stopPolling() {
        pollingTimer?.invalidate()
        pollingTimer = nil
        pollingAction = nil
    }
    
}
