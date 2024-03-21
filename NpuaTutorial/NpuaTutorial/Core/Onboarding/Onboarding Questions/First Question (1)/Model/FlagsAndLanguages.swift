//
//  FlagsAndLanguages.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 19.03.24.
//

import SwiftUI

struct FlagsAndLanguages: Hashable {
    let language: String
    let flag: String
    
    init(language: String, flag: String) {
        self.language = language
        self.flag = flag
    }
}
