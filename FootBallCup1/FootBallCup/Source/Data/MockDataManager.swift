//
//  DataManager.swift
//  FootBallCup
//
//  Created by Rajan Khattri on 1/17/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

protocol Team {
    var marks: [String] { get }
    var playerPictures: [[String]] { get }
}

struct Barcelona: Team {
    let marks = ["4/5", "3/5", "4/5", "2/5"]
    let playerPictures = [
        ["Barca-goalkeeper"],
        ["Barca-d1", "Barca-d2", "Barca-d3", "Barca-d4"],
        ["Barca-m1", "Barca-m2", "Barca-m3", "Barca-m4"],
        ["Barca-f1", "Barca-f2"]
    ]
}

struct RealMadrid: Team {
    let marks = ["1/5", "3/5", "3/5", "5/5"]
    let playerPictures = [
        ["Madrid-goalkeeper"],
        ["Madrid-d1", "Madrid-d2", "Madrid-d3", "Madrid-d4"],
        ["Madrid-m1", "Madrid-m2", "Madrid-m3", "Madridm4"],
        ["Madrid-f1", "Madrid-f2"]
    ]
}

struct PSG: Team {
    let marks = ["3/5", "2/5", "4/5", "5/5"]
    let playerPictures = [
        ["PSG-goalkeeper"],
        ["PSG-d1", "PSG-d2", "PSG-d3", "PSG-d4"],
        ["PSG-m1", "PSG-m2", "PSG-m3", "PSG-m4"],
        ["PSG-f1", "PSG-f2"]
    ]
}

struct City: Team {
    let marks = ["5/5", "4/5", "3/5", "1/5"]
    let playerPictures = [
        ["City-goalkeeper"],
        ["City-d1", "City-d2", "City-d3", "City-d4"],
        ["City-m1", "City-m2", "City-m3", "City-m4"],
        ["City-f1", "City-f2"]
    ]
}

