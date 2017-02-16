//
//  MainMenu.swift
//  Shoebox StyleApp without Xib
//
//  Created by uchcode on 2017/02/16.
//  Copyright © 2017 uchcode. All rights reserved.
//

import Cocoa

class MainMenu: NSMenu {

    private(set) var appName : String!

    let fontManager = NSFontManager.shared()

    var preferencesMenuItem : NSMenuItem {
        return self.items[0].submenu!.item(withTitle: "Preferences…")!
    }

    convenience init(appName: String) {
        self.init(title: "")

        self.appName = appName

        self.addItem(NSMenuItem())
        self.addItem(NSMenuItem())
        self.addItem(NSMenuItem())
        self.addItem(NSMenuItem())
        self.addItem(NSMenuItem())
        self.addItem(NSMenuItem())
        self.addItem(NSMenuItem())

        self.items[0].submenu = NSMenu(title: "Application")
        self.items[1].submenu = NSMenu(title: "File")
        self.items[2].submenu = NSMenu(title: "Edit")
        self.items[3].submenu = NSMenu(title: "Format")
        self.items[4].submenu = NSMenu(title: "View")
        self.items[5].submenu = NSMenu(title: "Window")
        self.items[6].submenu = NSMenu(title: "Help")

        let a = self.items[0].submenu!
        let b = self.items[1].submenu!
        let c = self.items[2].submenu!
        let d = self.items[3].submenu!
        let e = self.items[4].submenu!
        let f = self.items[5].submenu!
        let g = self.items[6].submenu!

        // Application
        a.addItem(withTitle: "About \(appName)", action: .about, keyEquivalent: "")
        a.addItem(.separator())
        a.addItem(withTitle: "Preferences…", action: nil, keyEquivalent: ",")
        a.addItem(.separator())
        a.addItem(withTitle: "Services", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            a.item(withTitle: "Services")?.submenu = s
            NSApp.servicesMenu = s
        }
        a.addItem(.separator())
        a.addItem(withTitle: "Hide \(appName)", action: .hide, keyEquivalent: "h")
        a.addItem(withTitle: "Hide Others", action: .hideOthers, keyEquivalent: "h"); do {
            a.item(withTitle: "Hide Others")?.keyEquivalentModifierMask = [.command, .option]
        }
        a.addItem(withTitle: "Show All", action: .unhideAll, keyEquivalent: "")
        a.addItem(.separator())
        a.addItem(withTitle: "Quit \(appName)", action: .terminate, keyEquivalent: "q")

        // File
        b.addItem(withTitle: "New", action: .newDocument, keyEquivalent: "n")
        b.addItem(withTitle: "Open…", action: .openDocument, keyEquivalent: "o")
        // Uncomment if you need.
        //b.addItem(withTitle: "Open Recent", action: nil, keyEquivalent: ""); do {
        //    let s = NSMenu()
        //    b.item(withTitle: "Open Recent")?.submenu = s
        //    s.addItem(withTitle: "Clear Menu", action: .clearRecentDocuments, keyEquivalent: "")
        //}
        b.addItem(.separator())
        b.addItem(withTitle: "Close", action: .performClose, keyEquivalent: "w")
        b.addItem(withTitle: "Save…", action: .save, keyEquivalent: "s")
        b.addItem(withTitle: "Save As…", action: .saveAs, keyEquivalent: "S")
        // Uncomment if you need.
        //b.addItem(withTitle: "Revert to Saved", action: .revertToSaved, keyEquivalent: "r")
        b.addItem(.separator())
        b.addItem(withTitle: "Page Setup…", action: .runPageLayout, keyEquivalent: "P")
        b.addItem(withTitle: "Print…", action: .printDocument, keyEquivalent: "p")

        // Edit
        c.addItem(withTitle: "Undo", action: .undo, keyEquivalent: "z")
        c.addItem(withTitle: "Redo", action: .redo, keyEquivalent: "Z")
        c.addItem(.separator())
        c.addItem(withTitle: "Cut", action: .cut, keyEquivalent: "x")
        c.addItem(withTitle: "Copy", action: .copy, keyEquivalent: "c")
        c.addItem(withTitle: "Paste", action: .paste, keyEquivalent: "v")
        c.addItem(withTitle: "Paste and Match Style", action: .pasteAsPlainText, keyEquivalent: "V"); do {
            c.item(withTitle: "Paste and Match Style")?.keyEquivalentModifierMask = [.command, .option]
        }
        c.addItem(withTitle: "Delete", action: .delete, keyEquivalent: "")
        c.addItem(withTitle: "Select All", action: .selectAll, keyEquivalent: "a")
        c.addItem(.separator())
        c.addItem(withTitle: "Find", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            c.item(withTitle: "Find")?.submenu = s
            s.addItem(withTitle: "Find…", action: .performFindPanelAction, keyEquivalent: "f"); do {
                s.item(withTitle: "Find…")?.tag = Int(NSFindPanelAction.showFindPanel.rawValue)
            }
            s.addItem(withTitle: "Find and Replace…", action: .performFindPanelAction, keyEquivalent: "f"); do {
                s.item(withTitle: "Find and Replace…")?.tag = 12
                s.item(withTitle: "Find and Replace…")?.keyEquivalentModifierMask = [.command, .option]
            }
            s.addItem(withTitle: "Find Next", action: .performFindPanelAction, keyEquivalent: "g"); do {
                s.item(withTitle: "Find Next")?.tag = Int(NSFindPanelAction.next.rawValue)
            }
            s.addItem(withTitle: "Find Previous", action: .performFindPanelAction, keyEquivalent: "G"); do {
                s.item(withTitle: "Find Previous")?.tag = Int(NSFindPanelAction.previous.rawValue)
            }
            s.addItem(withTitle: "Use Selection for Find", action: .performFindPanelAction, keyEquivalent: "e"); do {
                s.item(withTitle: "Use Selection for Find")?.tag = Int(NSFindPanelAction.setFindString.rawValue)
            }
            s.addItem(withTitle: "Jump to Selection", action: .centerSelectionInVisibleArea, keyEquivalent: "j")
        }
        c.addItem(withTitle: "Spelling and Grammar", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            c.item(withTitle: "Spelling and Grammar")?.submenu = s
            s.addItem(withTitle: "Show Spelling and Grammar", action: .showGuessPanel, keyEquivalent: ":")
            s.addItem(withTitle: "Check Document Now", action: .checkSpelling, keyEquivalent: ";")
            s.addItem(.separator())
            s.addItem(withTitle: "Check Spelling While Typing", action: .toggleContinuousSpellChecking, keyEquivalent: "")
            s.addItem(withTitle: "Check Grammar With Spelling", action: .toggleGrammarChecking, keyEquivalent: "")
            s.addItem(withTitle: "Correct Spelling Automatically", action: .toggleAutomaticSpellingCorrection, keyEquivalent: "")
        }
        c.addItem(withTitle: "Substitutions", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            c.item(withTitle: "Substitutions")?.submenu = s
            s.addItem(withTitle: "Show Substitutions", action: .orderFrontSubstitutionsPanel, keyEquivalent: "")
            s.addItem(.separator())
            s.addItem(withTitle: "Smart Copy/Paste", action: .toggleSmartInsertDelete, keyEquivalent: "")
            s.addItem(withTitle: "Smart Quotes", action: .toggleAutomaticQuoteSubstitution, keyEquivalent: "")
            s.addItem(withTitle: "Smart Dashes", action: .toggleAutomaticDashSubstitution, keyEquivalent: "")
            s.addItem(withTitle: "Smart Links", action: .toggleAutomaticLinkDetection, keyEquivalent: "")
            s.addItem(withTitle: "Data Detectors", action: .toggleAutomaticDataDetection, keyEquivalent: "")
            s.addItem(withTitle: "Text Replacement", action: .toggleAutomaticTextReplacement, keyEquivalent: "")
        }
        c.addItem(withTitle: "Transformations", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            c.item(withTitle: "Transformations")?.submenu = s
            s.addItem(withTitle: "Make Upper Case", action: .uppercaseWord, keyEquivalent: "")
            s.addItem(withTitle: "Make Lower Case", action: .lowercaseWord, keyEquivalent: "")
            s.addItem(withTitle: "Capitalize", action: .capitalizeWord, keyEquivalent: "")
        }
        c.addItem(withTitle: "Speech", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            c.item(withTitle: "Speech")?.submenu = s
            s.addItem(withTitle: "Start Speaking", action: .startSpeaking, keyEquivalent: "")
            s.addItem(withTitle: "Stop Speaking", action: .stopSpeaking, keyEquivalent: "")
        }

        // Format
        d.addItem(withTitle: "Font", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            d.item(withTitle: "Font")?.submenu = s
            s.addItem(withTitle: "Show Fonts", action: .orderFrontFontPanel, keyEquivalent: "t"); do {
                s.item(withTitle: "Show Fonts")?.target = fontManager
            }
            s.addItem(withTitle: "Bold", action: .addFontTrait, keyEquivalent: "b"); do {
                s.item(withTitle: "Bold")?.target = fontManager
                s.item(withTitle: "Bold")?.tag = Int(NSFontTraitMask.boldFontMask.rawValue)
            }
            s.addItem(withTitle: "Italic", action: .addFontTrait, keyEquivalent: "i"); do {
                s.item(withTitle: "Italic")?.target = fontManager
                s.item(withTitle: "Italic")?.tag = Int(NSFontTraitMask.italicFontMask.rawValue)
            }
            s.addItem(withTitle: "Underline", action: .underline, keyEquivalent: "u")
            s.addItem(.separator())
            s.addItem(withTitle: "Bigger", action: .modifyFont, keyEquivalent: "+"); do {
                s.item(withTitle: "Bigger")?.target = fontManager
                s.item(withTitle: "Bigger")?.tag = Int(NSFontAction.sizeUpFontAction.rawValue)
            }
            s.addItem(withTitle: "Smaller", action: .modifyFont, keyEquivalent: "-"); do {
                s.item(withTitle: "Smaller")?.target = fontManager
                s.item(withTitle: "Smaller")?.tag = Int(NSFontAction.sizeDownFontAction.rawValue)
            }
            s.addItem(.separator())
            s.addItem(withTitle: "Kern", action: nil, keyEquivalent: ""); do {
                let ss = NSMenu()
                s.item(withTitle: "Kern")?.submenu = ss
                ss.addItem(withTitle: "Use Default", action: .useStandardKerning, keyEquivalent: "")
                ss.addItem(withTitle: "Use None", action: .turnOffKerning, keyEquivalent: "")
                ss.addItem(withTitle: "Tighten", action: .tightenKerning, keyEquivalent: "")
                ss.addItem(withTitle: "Loosen", action: .loosenKerning, keyEquivalent: "")
            }
            s.addItem(withTitle: "Ligatures", action: nil, keyEquivalent: ""); do {
                let ss = NSMenu()
                s.item(withTitle: "Ligatures")?.submenu = ss
                ss.addItem(withTitle: "Use Default", action: .useStandardLigatures, keyEquivalent: "")
                ss.addItem(withTitle: "Use None", action: .turnOffLigatures, keyEquivalent: "")
                ss.addItem(withTitle: "Use All", action: .useAllLigatures, keyEquivalent: "")
            }
            s.addItem(withTitle: "Baseline", action: nil, keyEquivalent: ""); do {
                let ss = NSMenu()
                s.item(withTitle: "Baseline")?.submenu = ss
                ss.addItem(withTitle: "Use Default", action: .unscript, keyEquivalent: "")
                ss.addItem(withTitle: "Superscript", action: .superscript, keyEquivalent: "")
                ss.addItem(withTitle: "Subscript", action: .subscriptBaseline, keyEquivalent: "")
                ss.addItem(withTitle: "Raise", action: .raiseBaseline, keyEquivalent: "")
                ss.addItem(withTitle: "Lower", action: .lowerBaseline, keyEquivalent: "")
            }
            s.addItem(.separator())
            s.addItem(withTitle: "Show Colors", action: .orderFrontColorPanel, keyEquivalent: "C")
            s.addItem(.separator())
            s.addItem(withTitle: "Copy Style", action: .copyFont, keyEquivalent: "c"); do {
                s.item(withTitle: "Copy Style")?.keyEquivalentModifierMask = [.command, .option]
            }
            s.addItem(withTitle: "Paste Style", action: .pasteFont, keyEquivalent: "v"); do {
                s.item(withTitle: "Paste Style")?.keyEquivalentModifierMask = [.command, .option]
            }
        }
        d.addItem(withTitle: "Text", action: nil, keyEquivalent: ""); do {
            let s = NSMenu()
            d.item(withTitle: "Text")?.submenu = s
            s.addItem(withTitle: "Align Left", action: .alignLeft, keyEquivalent: "{")
            s.addItem(withTitle: "Center", action: .alignCenter, keyEquivalent: "|")
            s.addItem(withTitle: "Justify", action: .alignJustified, keyEquivalent: "")
            s.addItem(withTitle: "Align Right", action: .alignRight, keyEquivalent: "}")
            s.addItem(.separator())
            s.addItem(withTitle: "Writing Direction", action: nil, keyEquivalent: ""); do {
                let ss = NSMenu()
                s.item(withTitle: "Writing Direction")?.submenu = ss
                ss.addItem(withTitle: "Paragraph", action: nil, keyEquivalent: "").isEnabled = false
                ss.addItem(withTitle: " Default", action: .baseDirectionNatural, keyEquivalent: "")
                ss.addItem(withTitle: " Left to Right", action: .baseDirectionLeftToRight, keyEquivalent: "")
                ss.addItem(withTitle: " Right to Left", action: .baseDirectionRightToLeft, keyEquivalent: "")
                ss.addItem(.separator())
                ss.addItem(withTitle: "Selection", action: nil, keyEquivalent: "").isEnabled = false
                ss.addItem(withTitle: " Default", action: .textDirectionNatural, keyEquivalent: "")
                ss.addItem(withTitle: " Left to Right", action: .textDirectionLeftToRight, keyEquivalent: "")
                ss.addItem(withTitle: " Right to Left", action: .textDirectionRightToLeft, keyEquivalent: "")
            }
            s.addItem(.separator())
            s.addItem(withTitle: "Show Ruler", action: .toggleRuler, keyEquivalent: "")
            s.addItem(withTitle: "Copy Ruler", action: .copyRuler, keyEquivalent: "c"); do {
                s.item(withTitle: "Copy Ruler")?.keyEquivalentModifierMask = [.command, .control]
            }
            s.addItem(withTitle: "Paste Ruler", action: .pasteRuler, keyEquivalent: "v"); do {
                s.item(withTitle: "Paste Ruler")?.keyEquivalentModifierMask = [.command, .control]
            }
        }

        // View
        e.addItem(withTitle: "Show Toolbar", action: .toggleToolbarShown, keyEquivalent: "t"); do {
            e.item(withTitle: "Show Toolbar")?.keyEquivalentModifierMask = [.command, .option]
        }
        e.addItem(withTitle: "Customize Toolbar…", action: .runToolbarCustomizationPalette, keyEquivalent: "")
        e.addItem(.separator())
        e.addItem(withTitle: "Show Sidebar", action: .toggleSourceList, keyEquivalent: "s"); do {
            e.item(withTitle: "Show Sidebar")?.keyEquivalentModifierMask = [.command, .control]
        }

        // Window
        f.addItem(withTitle: "Minimize", action: .performMiniaturize, keyEquivalent: "m")
        f.addItem(withTitle: "Zoom", action: .performZoom, keyEquivalent: "")
        f.addItem(.separator())
        f.addItem(withTitle: "Bring All To Front", action: .arrangeInFront, keyEquivalent: "")
        NSApp.windowsMenu = f

        // Help
        g.addItem(withTitle: "\(appName) Help", action: .showHelp, keyEquivalent: "?")
        NSApp.helpMenu = g
    }
}

private extension Selector {

    // Application
    static let about      = #selector(NSApplication.orderFrontStandardAboutPanel(_:))
    static let hide       = #selector(NSApplication.hide(_:))
    static let hideOthers = #selector(NSApplication.hideOtherApplications(_:))
    static let unhideAll  = #selector(NSApplication.unhideAllApplications(_:))
    static let terminate  = #selector(NSApplication.terminate(_:))

    // File
    static let newDocument   = #selector(NSDocumentController.newDocument(_:))
    static let openDocument  = #selector(NSDocumentController.openDocument(_:))
    static let clearRecentDocuments = #selector(NSDocumentController.clearRecentDocuments(_:))
    static let performClose  = #selector(NSWindow.performClose(_:))
    static let save          = #selector(NSDocument.save(_:))
    static let saveAs        = #selector(NSDocument.saveAs(_:))
    static let revertToSaved = #selector(NSDocument.revertToSaved(_:))
    static let runPageLayout = #selector(NSApplication.runPageLayout(_:))
    static let printDocument = #selector(NSDocument.print(_:))

    // Edit
    static let undo      = Selector(("undo:"))
    static let redo      = Selector(("redo:"))
    static let cut       = #selector(NSText.cut(_:))
    static let copy      = #selector(NSText.copy(_:))
    static let paste     = #selector(NSText.paste(_:))
    static let pasteAsPlainText = #selector(NSTextView.pasteAsPlainText(_:))
    static let delete    = #selector(NSText.delete(_:))
    static let selectAll = #selector(NSResponder.selectAll(_:))

    static let performFindPanelAction       = #selector(NSTextView.performFindPanelAction(_:))
    static let centerSelectionInVisibleArea = #selector(NSResponder.centerSelectionInVisibleArea(_:))

    static let showGuessPanel                    = #selector(NSText.showGuessPanel(_:))
    static let checkSpelling                     = #selector(NSText.checkSpelling(_:))
    static let toggleContinuousSpellChecking     = #selector(NSTextView.toggleContinuousSpellChecking(_:))
    static let toggleGrammarChecking             = #selector(NSTextView.toggleGrammarChecking(_:))
    static let toggleAutomaticSpellingCorrection = #selector(NSTextView.toggleAutomaticSpellingCorrection(_:))

    static let orderFrontSubstitutionsPanel     = #selector(NSTextView.orderFrontSubstitutionsPanel(_:))
    static let toggleSmartInsertDelete          = #selector(NSTextView.toggleSmartInsertDelete(_:))
    static let toggleAutomaticQuoteSubstitution = #selector(NSTextView.toggleAutomaticQuoteSubstitution(_:))
    static let toggleAutomaticDashSubstitution  = #selector(NSTextView.toggleAutomaticDashSubstitution(_:))
    static let toggleAutomaticLinkDetection     = #selector(NSTextView.toggleAutomaticLinkDetection(_:))
    static let toggleAutomaticDataDetection     = #selector(NSTextView.toggleAutomaticDataDetection(_:))
    static let toggleAutomaticTextReplacement   = #selector(NSTextView.toggleAutomaticTextReplacement(_:))

    static let uppercaseWord  = #selector(NSResponder.uppercaseWord(_:))
    static let lowercaseWord  = #selector(NSResponder.lowercaseWord(_:))
    static let capitalizeWord = #selector(NSResponder.capitalizeWord(_:))

    static let startSpeaking = #selector(NSTextView.startSpeaking(_:))
    static let stopSpeaking  = #selector(NSTextView.stopSpeaking(_:))

    // Format
    static let orderFrontFontPanel = #selector(NSFontManager.orderFrontFontPanel(_:))
    static let addFontTrait        = #selector(NSFontManager.addFontTrait(_:))
    static let underline           = #selector(NSText.underline(_:))
    static let modifyFont          = #selector(NSFontManager.modifyFont(_:))

    static let useStandardKerning = #selector(NSTextView.useStandardKerning(_:))
    static let turnOffKerning     = #selector(NSTextView.turnOffKerning(_:))
    static let tightenKerning     = #selector(NSTextView.tightenKerning(_:))
    static let loosenKerning      = #selector(NSTextView.loosenKerning(_:))

    static let useStandardLigatures = #selector(NSTextView.useStandardLigatures(_:))
    static let turnOffLigatures     = #selector(NSTextView.turnOffLigatures(_:))
    static let useAllLigatures      = #selector(NSTextView.useAllLigatures(_:))

    static let unscript          = #selector(NSTextView.unscript(_:))
    static let superscript       = #selector(NSTextView.superscript(_:))
    static let subscriptBaseline = #selector(NSTextView.subscript(_:))
    static let raiseBaseline     = #selector(NSTextView.raiseBaseline(_:))
    static let lowerBaseline     = #selector(NSTextView.lowerBaseline(_:))

    static let orderFrontColorPanel = #selector(NSApplication.orderFrontColorPanel(_:))
    static let copyFont             = #selector(NSText.copyFont(_:))
    static let pasteFont            = #selector(NSText.pasteFont(_:))

    static let alignLeft      = #selector(NSText.alignLeft(_:))
    static let alignCenter    = #selector(NSText.alignCenter(_:))
    static let alignJustified = #selector(NSTextView.alignJustified(_:))
    static let alignRight     = #selector(NSText.alignRight(_:))

    static let baseDirectionNatural     = #selector(NSText.makeBaseWritingDirectionNatural(_:))
    static let baseDirectionLeftToRight = #selector(NSText.makeBaseWritingDirectionLeftToRight(_:))
    static let baseDirectionRightToLeft = #selector(NSText.makeBaseWritingDirectionRightToLeft(_:))
    static let textDirectionNatural     = #selector(NSText.makeTextWritingDirectionNatural(_:))
    static let textDirectionLeftToRight = #selector(NSText.makeTextWritingDirectionLeftToRight(_:))
    static let textDirectionRightToLeft = #selector(NSText.makeTextWritingDirectionRightToLeft(_:))

    static let toggleRuler = #selector(NSText.toggleRuler(_:))
    static let copyRuler   = #selector(NSText.copyRuler(_:))
    static let pasteRuler  = #selector(NSText.pasteRuler(_:))

    // View
    static let toggleToolbarShown             = #selector(NSWindow.toggleToolbarShown(_:))
    static let runToolbarCustomizationPalette = #selector(NSWindow.runToolbarCustomizationPalette(_:))
    static let toggleSourceList               = Selector(("toggleSourceList:"))

    // Window
    static let performMiniaturize = #selector(NSWindow.performMiniaturize(_:))
    static let performZoom        = #selector(NSWindow.performZoom(_:))
    static let arrangeInFront     = #selector(NSApplication.arrangeInFront(_:))
    
    // Help
    static let showHelp = #selector(NSApplication.showHelp(_:))
}
