//
//  ExtensionUIImage.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    func createTemporaryUrl(image: UIImage) -> URL?{
        
        if let imageData = image.pngData(){
            let tempDir = FileManager.default.temporaryDirectory.appendingPathComponent("tempImage")
            do{
                try imageData.write(to: tempDir)
                return tempDir
            }
            catch{
                //
            }
        }
        return nil
    }
}
