//
//  MockUpDataFirstScreen.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 27/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import UIKit

class MockUpDataFirstScreen{
    static let users = [User(name: "Adauto Pinheiro", photo: #imageLiteral(resourceName: "E8ADE665-E1EF-400B-B175-516484BA6F46") , rageMeasurer: RageMeasurer()), User(name: "Beatriz Plutarco", photo: #imageLiteral(resourceName: "WhatsApp Image 2019-04-29 at 14.11.31"), rageMeasurer: RageMeasurer()), User(name: "Valys Thiana", photo: #imageLiteral(resourceName: "WhatsApp Image 2019-04-29 at 14.11.17"), rageMeasurer: RageMeasurer()), User(name: "Alysson Façanha", photo: #imageLiteral(resourceName: "WhatsApp Image 2019-04-29 at 14.10.58"), rageMeasurer: RageMeasurer())]
    
    
    static let votes = [Vote(status: 1, user: users[0]), Vote(status: 1, user: users[1]), Vote(status: 1, user: users[2]), Vote(status: 1, user: users[3])]
    
    static let rules = [Rule(title: "Não pode bater no amiguinho", descript: "", status: 1, votes: votes), Rule(title: "Não pode falar polêmica", descript: "", status: 1, votes: votes), Rule(title: "Não pode chegar atrasado", descript: "", status: 1, votes: votes), Rule(title: "Não pode xingar o amiguinho", descript: "", status: 1, votes: votes)]
    
    static let conflicts = [Conflict(rageMeasurer: RageMeasurer(), creator: users[0], troubleMakers: [users[1]], brokenRules: [rules[0],rules[1]], createdAt: Date(), status: 1), Conflict(rageMeasurer: RageMeasurer(), creator: users[1], troubleMakers: [users[2]], brokenRules: [rules[1],rules[2]], createdAt: Date(), status: 1), Conflict(rageMeasurer: RageMeasurer(), creator: users[2], troubleMakers: [users[3]], brokenRules: [rules[2],rules[3]], createdAt: Date(), status: 1)]
    
}
