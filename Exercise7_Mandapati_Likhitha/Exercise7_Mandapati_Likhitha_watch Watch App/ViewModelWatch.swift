//
//  ViewModelWatch.swift
//  Exercise7_Mandapati_Likhitha_watch Watch App
//
//  Created by student on 11/6/22.
//

import Foundation
import WatchConnectivity
import SwiftUI

class ViewModelWatch : NSObject, WCSessionDelegate, ObservableObject{
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    var session: WCSession
    @Published var messageText = "Waiting for the image"
    @Published var messageImg = UIImage(systemName: "circle.fill")
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            print(message["message"])
            self.messageText = message["message"] as? String ?? "Unknown"
        }
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            self.messageImg = UIImage(data: messageData)
        }
    }
}
