//
//  THTTPSessionManager.swift
//  SampleProject
//
//  Created by trivo on 1/17/17.
//  Copyright © 2017 Tri Vo. All rights reserved.
//

import UIKit
import AFNetworking

class THTTPSessionManager: AFHTTPSessionManager {
    
    override func dataTask(with request: URLRequest, completionHandler: ((URLResponse, Any?, Error?) -> Void)? = nil) -> URLSessionDataTask {
        var modifiedRequest = request
        
        let reachability = self.reachabilityManager;
        if reachability.isReachable == false {
            modifiedRequest.cachePolicy = .returnCacheDataElseLoad
        }

        return super.dataTask(with: modifiedRequest, completionHandler: completionHandler)
    }
    
    override func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, completionHandler: @escaping (CachedURLResponse?) -> Void) {
        
        let response = proposedResponse.response
        let httpResponse = response as! HTTPURLResponse
        
        let headers = httpResponse.allHeaderFields
        var newResponse = proposedResponse
        
        if (headers["Cache-Control"] != nil) {
            var modifiedHeaders = headers as! [String : String]
            modifiedHeaders["Cache-Control"] = "max-age=60"
            let modifiedHttpResponse = HTTPURLResponse(url: httpResponse.url!, statusCode: httpResponse.statusCode, httpVersion: "HTTP/1.1", headerFields: modifiedHeaders)
            newResponse = CachedURLResponse(response: modifiedHttpResponse!, data: proposedResponse.data, userInfo: proposedResponse.userInfo, storagePolicy: proposedResponse.storagePolicy)
            
        }
        
        super.urlSession(session, dataTask: dataTask, willCacheResponse: newResponse, completionHandler: completionHandler)
     }
    
   
}
