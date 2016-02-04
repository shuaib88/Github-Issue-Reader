//
//  Issue.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/29/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import Foundation
import UIKit

class Issue {
    // MARK: Properties
    
    var issueName: String
    var posterID: String
    var date: String
    var status: String
    var body: String
    var url: String
    
    
    
    // MARK: Initialization
    
    /// initialize the issue with all the properties
    init (issueName: String, posterID: String, date: String, status: String, body: String, url: String) {

        self.issueName = issueName
        self.posterID = posterID
        self.date = date
        self.status = status
        self.body = body
        self.url = url
        
    }
    
}
