//
//  Jet.swift
//  swift-vehicle-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Jet: Plane {
    override func climb() {
        let higherAltitude = altitude + maxAltitude*(1/5)
        if higherAltitude < maxAltitude && inFlight == true {
            altitude = higherAltitude
            decelerate()
        } else if higherAltitude > maxAltitude && inFlight == true {
            altitude = maxAltitude
        } else if inFlight == false {
            altitude = 0
        }
    }
    
    override func dive() {
        let lowerAltitude = altitude - maxAltitude*(1/5)
        if altitude > 0 && lowerAltitude < altitude {
            altitude = lowerAltitude
            accelerate()
        } else if inFlight == false {
            altitude = 0
        }
    }
    
    func afterburner() {
        if inFlight == true && speed == maxSpeed {
            speed = maxSpeed*2
        }
    }
}
