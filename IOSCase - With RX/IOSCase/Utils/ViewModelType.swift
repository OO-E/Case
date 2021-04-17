//
//  ViewModelType.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    func transform(input: Input)
}
