//
//  ViewController.swift
//  RemoteControl-iOS
//
//  Created by Aaqib Hussain on 26/8/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var hostAddress: UITextField!
    @IBOutlet weak var port: UITextField!
    //Message to send
    @IBOutlet weak var message: UITextField!
    //Delay to produce
    @IBOutlet weak var delay: UITextField!
    //Model to handle message sending
    lazy var udpModel: UDPModel? = UDPModel()
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //Closes the UDP client
        udpModel?.close()
    }
    
    //MARK: Action
    @IBAction func sendMessage(_ sender: UIButton){
        
        if Util.isTextfieldEmpty(textField: hostAddress) || Util.isTextfieldEmpty(textField: port){
            
            self.showAlert(title: "Cannot Proceed", message: "Host Address or Port cannot be empty")
        }else{
            
            if !Util.isTextfieldEmpty(textField: message){
                
                udpModel?.hostAddress = hostAddress.text!
                udpModel?.port = Int32(port.text!)!
                udpModel?.message = message.text
                udpModel?.delay = delay.text
                udpModel?.postPacket()
                
            }else{
                
            self.showAlert(title: "Cannot Proceed", message: "Message cannot be empty")
            }
        }
        
        
    }

    @IBAction func enableBroadcast(_ sender: UIButton){
    
        udpModel?.broadcast()
    }
    
}

