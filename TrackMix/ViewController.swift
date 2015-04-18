//
//  ViewController.swift
//  TrackMix
//
//  Created by Tomochika Hara on 2015/04/18.
//  Copyright (c) 2015年 Tomochika Hara. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var textField: NSTextField!

    @IBOutlet weak var slider: NSSlider!
    
    var track: Track? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.track = Track()
        self.updateUserInterface()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func mute(sender: AnyObject) {
        self.track?.volume = 0
        self.updateUserInterface()
    }
    
    
    @IBAction func takeFloatValueForVolumeFrom(sender: AnyObject) {
        let senderName: String
        
        if let sender = sender as? NSControl {
            let newValue = sender.floatValue
            self.track?.volume = newValue
            self.updateUserInterface()
        }
    }

    func updateUserInterface() {
        
        if let volume = self.track?.volume {
            self.textField.floatValue = volume
            self.slider.floatValue = volume
        }
    }
}

