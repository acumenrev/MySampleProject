//
//  NetworkSessionManager.swift
//  SampleProject
//
//  Created by Tri Vo on 12/30/16.
//  Copyright © 2016 Tri Vo. All rights reserved.
//

import Foundation
import AFNetworking
import SwiftyJSON

class NetworkSessionManager {
    private var mSessionManager : THTTPSessionManager?
    
    init() {
        
    }
    
    deinit {
       self.mSessionManager = nil
    }
    
    fileprivate var sessionManager : THTTPSessionManager {
        get {
            self.configSessionManager()
            return self.mSessionManager!
        }
    }
    
    static let sharedInstance : NetworkSessionManager = {
       NetworkSessionManager()
    }()
    
    
    /// Config session manager
    private func configSessionManager() {
        guard mSessionManager == nil else {
            return
        }
        
        mSessionManager = THTTPSessionManager(baseURL: URL(string: "")!)
        
        // config request
        mSessionManager?.requestSerializer = AFJSONRequestSerializer(writingOptions: .prettyPrinted)
        mSessionManager?.requestSerializer.timeoutInterval = 15
        mSessionManager?.requestSerializer.cachePolicy = .reloadIgnoringLocalCacheData
        mSessionManager?.requestSerializer.setValue(APIConstants.Common.HttpHeader.Environment.1, forHTTPHeaderField: APIConstants.Common.HttpHeader.Environment.0)
        mSessionManager?.requestSerializer.setValue(APIConstants.Common.HttpHeader.ContentType.1, forHTTPHeaderField: APIConstants.Common.HttpHeader.ContentType.0)
        
        // config response
        mSessionManager?.responseSerializer = AFJSONResponseSerializer(readingOptions: .allowFragments)
        
    }
}

extension NetworkSessionManager {
    
    func get(_ url : String, params : NSDictionary?,
             success : @escaping (_ sessionTask : URLSessionDataTask?, _ response : Any?) -> (),
             fail : ((_ sessionTask : URLSessionDataTask?, _ error : Error) -> ())?) -> URLSessionDataTask {
        
        return self.sessionManager.get(url, parameters: params, progress: nil, success: { (sessionTask, responseObject) in
            success(sessionTask, responseObject)
        }) { (sessionTask, error) in
            fail?(sessionTask, error)
        }!
    }
    
    func post(_ url : String, params: NSDictionary?,
              success : @escaping (_ sessionTask : URLSessionDataTask?, _ response : Any?) -> (),
              fail : ((_ sessionTask : URLSessionDataTask?,_ error : Error) -> ())?) -> URLSessionDataTask {
        
        return self.sessionManager.post(url, parameters: params, progress: nil, success: { (sessionTask, responseObject) in
            success(sessionTask, responseObject)
        }) { (sessionTask, error) in
            fail?(sessionTask, error)
        }!
    }
    
    func put(_ url : String, params: NSDictionary?,
              success : @escaping (_ sessionTask : URLSessionDataTask?, _ response : Any?) -> (),
              fail : ((_ sessionTask : URLSessionDataTask?,_ error : Error) -> ())?) -> URLSessionDataTask {
        return self.sessionManager.put(url, parameters: params, success: { (sessionTask, responseObject) in
            success(sessionTask, responseObject)
        }, failure: { (sessionTask, error) in
            fail?(sessionTask, error)
        })!
    }
    
    func patch(_ url : String, params: NSDictionary?,
             success : @escaping (_ sessionTask : URLSessionDataTask?, _ response : Any?) -> (),
             fail : ((_ sessionTask : URLSessionDataTask?,_ error : Error) -> ())?) -> URLSessionDataTask {
        
        return self.sessionManager.patch(url, parameters: params, success: { (sessionTask, responseObject) in
            success(sessionTask, responseObject)
        }, failure: { (sessionTask, error) in
            fail?(sessionTask, error)
        })!
    }
    
    func delete(_ url : String, params: NSDictionary?,
               success : @escaping (_ sessionTask : URLSessionDataTask?, _ response : Any?) -> (),
               fail : ((_ sessionTask : URLSessionDataTask?,_ error : Error) -> ())?) -> URLSessionDataTask {
        
        return self.delete(url, params: params, success: { (sessionTask, responseObject) in
            success(sessionTask, responseObject)
        }, fail: { (sessionTask, error) in
            fail?(sessionTask, error)
        })
    }
    
}
