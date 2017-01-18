//
//  testUrl.swift
//  swTest
//
//  Created by LIM on 15.11.2016.
//  Copyright © 2016 LIM. All rights reserved.
//

import Foundation

protocol testUrlDelegate
{
    func getTestUrlResult(str: String)
}

class testUrl: NSObject, NSURLConnectionDelegate, NSURLConnectionDataDelegate
{
    var responseData: Data
    var delegate: testUrlDelegate?
    
    override init()
    {
        self.responseData = Data()
        super.init()
    }
    
    func go() -> Void {
        
        guard let u = URL(string: "https://stripe.com/") else
        {
             return
        }
        
        let r = URLRequest(url: u)
        let _ = NSURLConnection(request: r, delegate: self)
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        
        responseData.append(data)
        
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print (response)
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print(responseData)
        let s = String(data: responseData, encoding: String.Encoding.utf8) ?? ":("
        
        delegate?.getTestUrlResult(str: s)
        
        //let c = NSData.init(data: responseData)
        //let s = NSString.init(data: responseData, encoding: String.Encoding.utf8.rawValue)
        //print(s ?? ":(")
    }
}
