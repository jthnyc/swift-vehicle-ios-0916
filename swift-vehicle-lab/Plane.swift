//
//  Plane.swift
//  swift-vehicle-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane: Vehicle {
    let maxAltitude: Double
    var altitude = 0.0
    var inFlight: Bool {
        if speed.isZero == false && altitude > 0 {
            return true
        } else {
            return false
        }
    }
    
    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init (name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    func takeoff() {
        if inFlight == false {
            speed = maxSpeed*(1/10)
            altitude = maxAltitude*(1/10)
        }
    }
    
    func land() {
        speed = 0.0
        altitude = 0
    }
    
    func climb() {
        let higherAltitude = altitude + maxAltitude*(1/10)
        if higherAltitude < maxAltitude && inFlight == true {
            altitude = higherAltitude
            decelerate()
        } else if higherAltitude > maxAltitude && inFlight == true {
            altitude = maxAltitude
        } else if inFlight == false {
            altitude = 0
        }
    }
    
    func dive() {
        let lowerAltitude = altitude - maxAltitude*(1/10)
        if altitude > 0 && lowerAltitude < altitude {
            altitude = lowerAltitude
            accelerate()
        } else if inFlight == false {
            altitude = 0
        }
    }
        
    func bankRight() {
        let turnRight = heading + 45.0
        let overTurn = heading - 360
        let lowerSpeed = speed - speed*(1/10)
        if inFlight == true && turnRight <= 360 {
            heading = turnRight
            speed = lowerSpeed
        } else if inFlight == true && turnRight >= 360 {
            heading = overTurn
            speed = lowerSpeed
        } else if inFlight == false {
            heading = 0
        }
    }
    
    func bankLeft() {
        let turnLeft = heading + 315.0
        let overTurn = heading - 45.0
        let lowerSpeed = speed - speed*(1/10)
        if inFlight == true && turnLeft <= 360 {
            heading = turnLeft
            speed = lowerSpeed
        } else if inFlight == true && turnLeft > 360 {
            heading = overTurn
            speed = lowerSpeed
        } else if inFlight == false {
            heading = 0
        }
    }
    
}

