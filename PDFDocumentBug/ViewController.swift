//
//  ViewController.swift
//  PDFDocumentBug
//
//  Created by Soulchild on 05/09/2018.
//  Copyright © 2018 soulchild. All rights reserved.
//

import Cocoa
import Quartz

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func openPDFClicked(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["pdf"]
        
        if(openPanel.runModal() == NSApplication.ModalResponse.OK){
            if let pdfURL = openPanel.url {
                // memory leak happens here
                let pdf = PDFDocument(url: pdfURL)
            }
        }
        
    }
}

