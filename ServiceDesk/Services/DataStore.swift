//
//  DataStore.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    let names = [
        "John",
        "Aaron",
        "Tim",
        "Ted",
        "Steven",
        "Max",
        "Milena",
        "James",
        "Robert",
        "David"
    ]
    
    let surnames = [
        "Smith",
        "Dow",
        "Isaacson",
        "Pennyworth",
        "Jankins",
        "McDonald",
        "Anderson",
        "Brown",
        "White",
        "Moore"
    ]
    
    let phones = [
        "+1 (415) 555‑0132",
        "+1 (213) 483‑7483",
        "+1 (800) 398‑9837",
        "+1 (353) 359‑3424",
        "+1 (643) 934‑5784",
        "+1 (754) 765‑4532",
        "+1 (548) 890‑0987",
        "+1 (690) 345‑2398",
        "+1 (709) 924‑9054",
        "+1 (423) 435‑1239"
    ]
    
    let emails = [
        "golden.viso@gmail.com",
        "smart_dumo@gmail.com",
        "falloutman@gmail.com",
        "player007@gmail.com",
        "worldboss@gmail.com",
        "timl@gmail.com",
        "jumbowumbo@gmail.com",
        "fatalerror@gmail.com",
        "sl_qwerty@gmail.com",
        "swiftbook@gmail.com",
    ]
    
    let positions = [
        "Lead",
        "Vice president",
        "Principal",
        "Supervisor",
        "Executive officer",
        "Manager",
        "Senior Dev",
        "Director",
        "Assistant Manager",
        "Coordinator",
    ]
    
    private init() {}
}
