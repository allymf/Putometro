//
//  Rule.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation

struct Rule {
    var title: String
    var description: String
    var status: RuleStatus
    var votes: [Vote]
}
