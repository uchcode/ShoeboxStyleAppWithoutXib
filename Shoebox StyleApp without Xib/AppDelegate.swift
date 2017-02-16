//
//  AppDelegate.swift
//  Shoebox StyleApp without Xib
//
//  Created by uchcode on 2017/02/16.
//  Copyright © 2017 uchcode. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    let window = NSWindow(contentRect: NSMakeRect(335, 390, 480, 360), styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)

    func applicationDidFinishLaunching(_ notification: Notification) {
        window.title = "Programmatically"
        window.identifier = "ProgrammaticallyWindow"
        window.delegate = self
        window.isOneShot = true
        window.setIsVisible(true)
    }

    func applicationWillTerminate(_ notification: Notification) {
        // Insert code here to tear down your application
    }

    func windowWillClose(_ notification: Notification) {
        NSApp.terminate(notification)
    }
    
}
