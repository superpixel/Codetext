//
//  AppDelegate.swift
//  Codetext
//
//  Created by Nico Rohrbach on 22.04.19.
//  Copyright © 2019 Nico Rohrbach. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var outlet_unicode_input: NSTextField!
    @IBOutlet weak var outlet_output: NSTextField!
    @IBOutlet weak var button_copy: NSButton!
    
    @IBAction func action_input(_ sender: Any) {
        let myInput = outlet_unicode_input.stringValue
        let myInputArray = myInput.components(separatedBy: " ")
        var myWorkingString = String()
        for i in myInputArray {
            myWorkingString += stringToUnicodeChar(inputString: i)
        }
        outlet_output.stringValue = myWorkingString
    }
    
    @IBAction func action_copy(_ sender: Any) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([outlet_output.stringValue as NSString])

    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func stringToUnicodeChar(inputString: String) -> String {
        if let charCode = UInt32(inputString, radix: 16),
            let unicode = UnicodeScalar(charCode) {
            let str = String(unicode)
            return(str)
        } else {
            return("invalid")
        }
    }

}
