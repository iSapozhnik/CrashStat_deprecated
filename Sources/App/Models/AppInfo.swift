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

final class Payload: SQLiteModel {
    var id: Int?
    
    var display_id: Int
    var title: String
    var method: String
    var impact_level: Int
    var crashes_count: Int
    var impacted_devices_count: Int
    var url: String
    
    init(id: Int? = nil, display_id: Int, title: String, method: String, impact_level: Int, crashes_count: Int, impacted_devices_count: Int, url: String) {
        self.id = id
        self.display_id = display_id
        self.title = title
        self.method = method
        self.impact_level = impact_level
        self.crashes_count = crashes_count
        self.impacted_devices_count = impacted_devices_count
        self.url = url
    }
}

final class AppInfo: SQLiteModel {
    var id: Int?
    
    var event: String
    var payload_type: String
    var payload: Payload
    var platform: String?
    var app: String?
    
    init(id: Int? = nil, event: String, payload_type: String, payload: Payload, platform: String?, app: String?) {
        self.id = id
        self.event = event
        self.payload_type = payload_type
        self.payload = payload
        self.platform = platform
        self.app = app
    }
}

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
