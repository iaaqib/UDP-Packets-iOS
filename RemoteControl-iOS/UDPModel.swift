//
//  UDPModel.swift
//  RemoteControl-iOS
//
//  Created by Aaqib Hussain on 26/8/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import Foundation
import SwiftSocket

class UDPModel: NSObject {
    //MARK: Vars
    typealias onSent =  ((_ sent:Bool)->())?
    
    private var client: UDPClient?
    /**
     Host Address, default is loopback address i.e. 127.0.0.1
     */
    var hostAddress: String! = "127.0.0.1"
    /**
     Port, default is 8080
     */
    var port: Int32! = 8080
    /**
     Message to be sent to the destination
     */
    var message: String!
    /**
     Pause to send
     */
    var delay: String?
    
    //MARK: Initializers
    override init() {
        super.init()
    }
    
    init(hostAddress: String, port: Int32) {
        
        self.hostAddress = hostAddress
        self.port = port
    }
    
    //MARK: Functions
    /**
     Posting Message
     - Parameter  completion: Declared optional, returns true or false depending on Packet Delivery status.
     */
    func postPacket(completion: onSent = nil){
        
        let newMessage = delay == "" || delay == nil ? message.appending("\n") : message.appending("\n").appending("a \(delay!) ms pause").appending("\n")
        
        if let client = client, client.address == hostAddress, client.port == port{
            
            sendMessage(message: newMessage, client: client, completion: { (success) in
                if let complete = completion{
                    complete(success)
                }
            })
            
            
        }else{
            
            close()
            
            client = UDPClient(address: hostAddress, port: port)
            sendMessage(message: newMessage, client: client!, completion: { (success) in
                if let complete = completion{
                    complete(success)
                }
            })
            
        }
        
    }
    
    
    //Sends Message
    private func sendMessage(message: String, client: UDPClient, completion: onSent = nil){
        
        
        switch client.send(string: message ) {
        case .success:
            if let success = completion{
                success(true)
                debugPrint("Packet sent")
            }
            break;
        case .failure(let error):
            debugPrint(error)
            if let success = completion{
                success(false)
                
            }
        }
        
        
    }
    
    //Broadcast
    func broadcast(){
        
        if client != nil{
            client!.enableBroadcast()
        }else{
            
            debugPrint("Unable to enable broadcast.")
        }
        
        
    }
    
    //Close UDP Client
    func close(){
        if client != nil{
            client!.close()
        }
    }
    
}
