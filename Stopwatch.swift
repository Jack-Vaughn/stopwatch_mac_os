//
//  Stopwatch.swift
//  Stopwatch Xib
//
//  Created by Vaughn, Jack on 3/26/15.
//  Copyright (c) 2015 ERHS. All rights reserved.
//

import Cocoa

struct Variables {
    static var startTime = NSTimeInterval();
    static var clockTimer = NSTimer();
    static var hours = "00";
    static var minutes = "00";
    static var seconds = "00";
    static var milliseconds = "00";
    static var hoursContainer = "00";
    static var minutesContainer = "00";
    static var secondsContainer = "00";
    static var millisecondsContainer = "00";
}

class Stopwatch: NSObject {
    
    //------------------------------------GETTERS/SETTERS---------------------------------------------------
    
    func isClockTimerValid() -> Bool{
        return Variables.clockTimer.valid;
    }
    
    func setClockTimer(timer: NSTimer) {
        Variables.clockTimer = timer;
    }
    
    func setStartTime(timer: Double) {
        Variables.startTime = timer;
    }
    
    //------------------------------------Functions---------------------------------------------------
    
    func pause() {
        Variables.clockTimer.invalidate();
        
        Variables.hoursContainer = Variables.hours;
        Variables.minutesContainer = Variables.minutes;
        Variables.secondsContainer = Variables.seconds;
        Variables.millisecondsContainer = Variables.milliseconds;
    }
    
    func reset() {
        Variables.clockTimer.invalidate();
        zeroOut();
    }
    
    func start(){
        
        var currentTime = NSDate.timeIntervalSinceReferenceDate();
        var elapsedTime: NSTimeInterval = currentTime - Variables.startTime;
        
        var hours = UInt8(elapsedTime / 3600.0);
        elapsedTime -= (NSTimeInterval(hours) * 3600);
        hours = hours + UInt8(Variables.hoursContainer.toInt()!);
        
        var minutes = UInt8(elapsedTime / 60.0);
        elapsedTime -= (NSTimeInterval(minutes) * 60);
        minutes = minutes + UInt8(Variables.minutesContainer.toInt()!);
        
        var seconds = UInt8(elapsedTime);
        elapsedTime -= (NSTimeInterval(seconds));
        seconds = seconds + UInt8(Variables.secondsContainer.toInt()!);
        
        var fraction = UInt8(elapsedTime * 100);
        fraction = fraction + UInt8(Variables.millisecondsContainer.toInt()!);
        
        if fraction < 100{
            if fraction < 10{
                Variables.milliseconds = "0" + String(fraction);
            }else{
                Variables.milliseconds = String(fraction);
            }
        }else{
            seconds++;
            if fraction < 110{
                Variables.milliseconds = "0" + String(fraction - 100);
            }else{
                Variables.milliseconds = String(fraction - 100);
            }
        }
        
        if seconds < 60{
            if seconds < 10{
                Variables.seconds = "0" + String(seconds);
            }else{
                Variables.seconds = String(seconds);
            }
        }else{
            minutes++;
            if seconds < 70{
                Variables.seconds = "0" + String(seconds - 60);
            }else{
                Variables.seconds = String(seconds - 60);
            }
        }
        
        if minutes < 60{
            if minutes < 10{
                Variables.minutes = "0" + String(minutes);
            }else{
                Variables.minutes = String(minutes);
            }
        }else{
            hours++;
            if minutes < 70{
                Variables.minutes = "0" + String(minutes - 60);
            }else{
                Variables.minutes = String(minutes - 60);
            }
        }
        
        if hours < 100{
            if hours < 10{
                Variables.hours = "0" + String(hours);
            }else{
                Variables.hours = String(hours);
            }
        }else{
            if hours < 110 {
                Variables.hours = "0" + String(hours - 100);
            }else{
                Variables.hours = String(hours - 100);
            }
        }
        
    }
    
    func zeroOut() {
        Variables.hours = "00";
        Variables.minutes = "00";
        Variables.seconds = "00";
        Variables.milliseconds = "00";
        Variables.hoursContainer = "00";
        Variables.minutesContainer = "00";
        Variables.secondsContainer = "00";
        Variables.millisecondsContainer = "00";
    }
    
}
