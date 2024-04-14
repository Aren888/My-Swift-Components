//
//  StringExtension.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 14.04.24.
//

import Foundation

extension String {
    var isValidFullName: Bool {
        let fullNameRegEx = #"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"#
        let fullNamePredicate = NSPredicate(format: "SELF MATCHES %@", fullNameRegEx)
        return fullNamePredicate.evaluate(with: self)
    }
    
    var isValidUserName: Bool {
        let userNameRegEx = #"^[a-zA-Z0-9._-]{3,}$"#
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegEx)
        return userNamePredicate.evaluate(with: self)
    }
}
