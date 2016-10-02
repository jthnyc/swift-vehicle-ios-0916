//
//  Vehicle.swift
//  swift-vehicle-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Vehicle {
    let name: String
    let weight: Double
    let maxSpeed: Double
    var speed: Double = 0.0
    var heading: Double = 0.0  // measured in angles, needs to be between 0-360
    
    init (name: String, weight: Double, maxSpeed: Double){
        self.name = name
        self.weight = weight
        self.maxSpeed = maxSpeed
    }
    
    func goFast() {
        speed = maxSpeed
    }
    
    func halt() {
        speed = 0.0
    }
    
    func accelerate() {
        let increase = speed + (1/10)*maxSpeed
        if increase <= maxSpeed {
            self.speed = increase
        } else {
            self.speed = maxSpeed
        }
    }
    
    func decelerate() {
        let decrease = speed - (1/10)*maxSpeed
        if decrease > 0 {
            speed = decrease
        } else if decrease < 0{
            speed = 0
        }
    }
    
    func turnRight() {
        let rightHeading = heading + 90.0
        let donutTurn = heading - 360
        let rightSpeed = speed/2
        if speed.isZero == true {
            self.heading = 0
        } else {
            if rightHeading <= 360 {
                self.heading = rightHeading
                self.speed = rightSpeed
            } else if rightHeading > 360 {
                self.heading = donutTurn
            }
        }
    }
    
    func turnLeft() {
        let leftHeading = heading + 270
        let donutTurn = heading - 90
        let leftSpeed = speed/2
        if speed.isZero == true {
            heading = 0
        } else {
            if leftHeading <= 360 {
                self.heading = leftHeading
                self.speed = leftSpeed
            } else if leftHeading > 360 {
                self.heading = donutTurn
                speed = leftSpeed
            }
        }
    }
    
            
}

