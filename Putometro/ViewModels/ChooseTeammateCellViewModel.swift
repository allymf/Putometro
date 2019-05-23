//
//  ChooseTeammateCellViewModel.swift
//  Putometro
//
//  Created by Bia Plutarco on 22/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class ChooseTeammateCellViewModel: TeammateCellViewModelProtocol {
    var image: UIImage {
        return #imageLiteral(resourceName: "houcine-ncib-1579803-unsplash")
    }
    
    var name: String {
        return "aaaaaa"
    }
    
    var color: UIColor {
        return UIColor.AppColors.red
    }
    
    func setupCell(_ cell: TeammateCell) {
        cell.setupCell(color: self.color, name: self.name, photo: self.image)
    }
}
