//
//  main.swift
//  Shoebox StyleApp without Xib
//
//  Created by uchcode on 2017/02/16.
//  Copyright © 2017 uchcode. All rights reserved.
//

import Cocoa

NSApplication.shared()
private let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "App"
private let mainMenu = MainMenu(appName: appName)
private let appDelegate = AppDelegate()
NSApp.mainMenu = mainMenu
NSApp.delegate = appDelegate
NSApp.run()
