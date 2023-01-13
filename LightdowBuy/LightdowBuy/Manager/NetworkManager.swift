//
//  NetworkManager.swift
//  LightdowBuy
//
//  Created by Nick on 2022/11/4.
//

import Foundation
import Alamofire
import PromiseKit
import CloudKit
import FirebaseAuth
import Firebase


class NetworkManager {
    
    static let shared = NetworkManager(configure: .production())
    
    
    struct Configure {
        static let sheetdbURL = "https://sheetdb.io/"
        static let apiPath = "api/"
        static let version = "v1/"
        
        enum Environment {
            case sheetdbURL
        }
        
        let environment: Environment
        let host: String
        
        var apiUrl: String {
            host + Configure.apiPath + Configure.version
        }
        
        static func production() -> Configure {
            Configure(environment: .sheetdbURL, host: Configure.sheetdbURL)
        }
       
    }
    
    var configure: Configure
    private init(configure: Configure) {
        self.configure = configure
    }
    
    enum Action {
        case lightdowBuy(LightdowBuy)
        
        enum LightdowBuy {
            case productListkey
            case userBuyListKey
            
            
            var suffix: String {
                switch self {
                case .productListkey:
                    return "84u1pvxdpxcrg"
                case .userBuyListKey:
                    return "lan18sfshteot"
                }
            }
        }
        
        var suffix: String {
            switch self {
            case .lightdowBuy(let lightdowBuy):
                return lightdowBuy.suffix
            }
        }
    }
    
    func getAPIURL(action: Action) -> String {
        switch action {
        case .lightdowBuy:
            return configure.apiUrl + action.suffix
        }
    }
    
    func getData<T:Codable>(method: HTTPMethod, action: Action, ofType: T.Type, parameters: Parameters?) -> Promise<T> {
        return Promise<T> { seal in
            let url = getAPIURL(action: action)
            
            #if DEBUG
            print("DEBUG -- url: \(url)")
            #endif
            
            var encoding: ParameterEncoding
            switch action {
            case .lightdowBuy:
                encoding = URLEncoding.default
            default:
                encoding = method == .get ? URLEncoding.default : JSONEncoding.default
            }
            
            #if DEBUG
            print("DEBUG -- parameters: \(String(describing: parameters))")
            #endif
            
            AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: authorizationHeader) { $0.timeoutInterval = 300.0 }
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        
                        do {
                            let response = try decoder.decode(T.self, from: data)
                            seal.fulfill(response)
                        } catch {
                            #if DEBUG
                            print("[DEBUG] decode error:\(error)")
                            #endif
                            
                            seal.reject(error)
                        }
                    } else {
                        let error = NSError(domain: "unknow error", code: -1, userInfo: nil)
                        seal.reject(error)
                    }
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        let error = NSError(domain: "要求逾時", code: -1001, userInfo: nil)
                        seal.reject(error)
                    } else {
                        #if DEBUG
                        print("DEBUG -- getData error:\(error)")
                        #endif
                        seal.reject(error)
                    }
                }
            } .responseString { string in
                #if DEBUG
                print("[DEBUG] response string: \(string)")
                #endif
            }
            
        }
    }
    
    
    var authorizationHeader: HTTPHeaders {
        if let token = Auth.auth().currentUser?.uid {
            print("[DEBUG] token:\(token)")
            let header = HTTPHeader.authorization(bearerToken: token)
            var headers = HTTPHeaders()
            headers.add(header)
            return headers
        } else {
            return HTTPHeaders()
        }
    }
    
}



