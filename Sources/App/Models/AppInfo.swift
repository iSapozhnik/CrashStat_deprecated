//
//  AppInfo.swift
//  App
//
//  Created by Ivan Sapozhnik on 11/9/18.
//

import FluentSQLite
import Vapor

/*
 
Example

{
    "event": "issue_impact_change",
    "payload_type": "issue",
    "payload": {
        "display_id": 123 ,
        "title": "Issue Title" ,
        "method": "methodName of issue",
        "impact_level": 2,
        "crashes_count": 54,
        "impacted_devices_count": 16,
        "url": "http://crashlytics.com/full/url/to/issue"
    }
}
 
*/

enum Platform: String {
    case ios
    case android
    case unknown
}

enum App: String {
    case prod
    case alpha
    case beta
    case dev
}

final class AppInfo: SQLiteModel {
    var id: Int?
    
    var issueId: String
    var issueTitle: String
    var appName: String
    var appPlatform: String
    var appId: String
    var latestAppVersion: String
    var crashPercentage: Int
    var crashes: Int
    
    init(issueId: String, issueTitle: String, appName: String, appPlatform: String, appId: String, latestAppVersion: String, crashPercentage: Int, crashes: Int) {
        self.issueId = issueId
        self.issueTitle = issueTitle
        self.appName = appName
        self.appId = appId
        self.appPlatform = appPlatform
        self.latestAppVersion = latestAppVersion
        self.crashPercentage = crashPercentage
        self.crashes = crashes
    }
}

//final class AppInfo: SQLiteModel {
//    var id: Int?
//    
//    var event: String
//    var payload_type: String
//    var payload: Payload
//    var platform: String?
//    var app: String?
//    
//    init(id: Int? = nil, event: String, payload_type: String, payload: Payload, platform: String?, app: String?) {
//        self.id = id
//        self.event = event
//        self.payload_type = payload_type
//        self.payload = payload
//        self.platform = platform
//        self.app = app
//    }
//}

final class Crash: Content {
    var ios: Int
    var android: Int
    
    init(iosCount: Int, androidCount: Int) {
        self.ios = iosCount
        self.android = androidCount
    }
}

extension AppInfo: Migration {}
extension AppInfo: Content {}
