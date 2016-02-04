//
//  Helper.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/31/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import Foundation

class Helper {
    
    static func dateFormatter(dateToBeParsed: String) -> String {
        
        // Turn sample string into nsDateObject
        // - Attributions: http://stackoverflow.com/questions/5185230/converting-an-iso-8601-timestamp-into-an-nsdate-how-does-one-deal-with-the-utc
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        let nsDateObject = dateFormatter.dateFromString(dateToBeParsed)
        
        // Turn nsDate Object into correctly formatted date string
        // - Attributions: http://nshipster.com/nsformatter/
        // creating NSDateFormatter
        let formatter = NSDateFormatter()
        formatter.dateStyle = .LongStyle
        formatter.timeStyle = .ShortStyle
        
        //output
        let formattedDateString = formatter.stringFromDate(nsDateObject!)
        return formattedDateString
    }
    
    
    // MARK: - Data Retrieval and Processing
    
    /// Make a request using GitHub API v3 for issues.  This will download the
    /// issues, test that the data is valid, unserialize the JSON into an `Array`
    /// of `Dictionary`'s and then execute the completion closure.

    /// - Parameter urlString: A `String` of the URL holding the JSON
    /// - Parameter completion: A closure to run on the converted JSON
    /// - Attributions: Assignment write-up
    
    
    static func issuesRequestion(urlString: String, completion:([[String: AnyObject]]?) -> Void) {
        
        // Test that we can convert the `String` into an `NSURL` object.  If we can
        // not, then crash the application.
        guard let url = NSURL(string: urlString)  else {
            fatalError("No URL")
        }
        
        // Create a `NSURLSession` object
        let session = NSURLSession.sharedSession()
        
        // Create a task for the session object to complete
        let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            
            // Check for errors that occurred during the download.  If found, execute
            // the completion block with `nil`
            guard error == nil else {
                print("error: \(error!.localizedDescription): \(error!.userInfo)")
                completion(nil)
                return
            }
            
            // Print the response headers (for debugging purpose only)
            //            print(response)
            
            // Test that the data has a value and unwrap it to the variable `let`.  If
            // it is `nil` than pass `nil` to the completion closure.
            guard let data = data else {
                print("There was no data")
                completion(nil)
                return
            }
            
            // Unserialze the JSON that was retrieved into an Array of Dictionaries.
            // Pass is as parameter to the completion block.
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let issues = json as? [[String: AnyObject]] {
                    completion(issues)
                }
            } catch {
                print("error serializing JSON: \(error)")
                completion(nil)
            }
        })
        
        // Start the downloading.  NSURLSession objects are created in the paused
        // state, so to start it we need to tell it to *resume*
        task.resume()
    }
    
}