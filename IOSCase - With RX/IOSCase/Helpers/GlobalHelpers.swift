//
//  GlobalHelpers.swift
//  IOSCase
//
//  Created by OO E on 5.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

func mainThread(main: @escaping () -> ()) {
    DispatchQueue.main.async(execute: {
        main()
    })
}
