//
//  Racecar.swift
//  swift-vehicle-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class RaceCar: Car {
    let driver: String
    var sponsors: [String]
    
    init(name: String, weight: Double, maxSpeed: Double, transmission: String, cylinders: Int, milesPerGallon: Double, driver:String, sponsors: [String]) {
        self.driver = driver
        self.sponsors = sponsors
        super.init(name: name, weight: weight, maxSpeed: maxSpeed, transmission: transmission, cylinders: cylinders, milesPerGallon: milesPerGallon)
    }
    
    override func accelerate() {
       if speed < maxSpeed {
            speed = speed + (1/5)*maxSpeed
        }
        if speed > maxSpeed { speed = maxSpeed }
    }
    
    override func decelerate() {
        let decrease = speed - (1/5)*maxSpeed
        if decrease > 0 {
            speed = decrease
        } else if decrease < 0{
            speed = 0
        }
    }
    
    func driftRight() {
        let rightHeading = heading + 90.0
        let donutTurn = heading - 360
        let rightSpeed = speed - speed*(1/4)
        if speed.isZero == true {
            self.heading = 0
        } else {
            if rightHeading <= 360 {
                self.heading = rightHeading
                self.speed = rightSpeed
            } else if rightHeading >= 360 {
                self.heading = donutTurn
            }
        }
    }
    
    func driftLeft() {
        let leftHeading = heading + 270
        let donutTurn = heading - 90
        let leftSpeed = speed - speed*(1/4)
        if speed.isZero == true {
            self.heading = 0
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
