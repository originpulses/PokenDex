//
//  SpecieDetailViewModel.swift
//  PokenDex
//
//  Created by Sabih on 24/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

class SpecieDetailViewModel {
    
    var specieDetail: SpeciesDetail
    
    init(specieDetail: SpeciesDetail) {
        self.specieDetail = specieDetail
    }
    
    func getDataDescription() -> String {
        var result: String = ""
        if let flavor_text_entries = specieDetail.flavor_text_entries {
            for flavor in flavor_text_entries {
                if (flavor.language?.name?.elementsEqual("en"))! && ((flavor.language?.name?.elementsEqual("alpha-sapphire")) != nil) {
                    if let text = flavor.flavor_text {
                        result = text.replacingOccurrences(of: "\n", with: " ")
                    }
                }
            }
            return result
        }
        return ""
    }
    
}
