//
//  AppDelegate.swift
//  Stopwatch Xib
//
//  Created by Vaughn, Jack on 3/26/15.
//  Copyright (c) 2015 ERHS. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    //------------------------------------Objects---------------------------------------------------
    var stopwatch = Stopwatch()
    
    //------------------------------------Outlets---------------------------------------------------
    @IBOutlet weak var hours: NSTextField!
    @IBOutlet weak var minutes: NSTextField!
    @IBOutlet weak var seconds: NSTextField!
    @IBOutlet weak var milliseconds: NSTextField!
    @IBOutlet weak var leftButton: NSButton!
    @IBOutlet weak var rightButton: NSButton!
    
    //------------------------------------IBActions---------------------------------------------------
    @IBAction func buttonPressed(sender: NSButton) {
        switch (sender.title) {
        case ("Start"):
            timer();
            leftButton.title = "Pause";
            leftButton.font = NSFont(name: "Didot", size: 30);
            rightButton.title = "Reset";
            rightButton.font = NSFont(name: "Didot", size: 30);
            rightButton.enabled = false;
        case ("Pause"):
            stopwatch.pause();
            leftButton.title = "Resume";
            leftButton.font = NSFont(name: "Didot", size: 20);
            rightButton.title = "Reset";
            rightButton.font = NSFont(name: "Didot", size: 30);
            rightButton.enabled = true;
        case ("Resume"):
            timer();
            leftButton.title = "Pause";
            leftButton.font = NSFont(name: "Didot", size: 30);
            rightButton.title = "Reset";
            rightButton.font = NSFont(name: "Didot", size: 30);
            rightButton.enabled = false;
        case ("Reset"):
            stopwatch.reset();
            updateLabels();
            leftButton.title = "Start";
            leftButton.font = NSFont(name: "Didot", size: 30);
            rightButton.title = "Stop";
            rightButton.font = NSFont(name: "Didot", size: 30);
            rightButton.enabled = true;
        default:
            leftButton.title = "Start";
            leftButton.font = NSFont(name: "Didot", size: 30);
            rightButton.title = "Stop";
            rightButton.font = NSFont(name: "Didot", size: 30);
            rightButton.enabled = true;
        }
    }
    
    //------------------------------------Functions---------------------------------------------------
    func timer() {
        if !stopwatch.isClockTimerValid() {
            let aSelector: Selector = "start";
            Variables.clockTimer = NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: aSelector, userInfo: nil, repeats: true);
            Variables.startTime = NSDate.timeIntervalSinceReferenceDate();
        }
    }
    
    func start() {
        stopwatch.start();
        updateLabels();
    }
    
    func updateLabels() {
        hours.stringValue = Variables.hours;
        minutes.stringValue = Variables.minutes;
        seconds.stringValue = Variables.seconds;
        milliseconds.stringValue = Variables.milliseconds;
    }


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }


}

