//
//  AppInfoController.swift
//  App
//
//  Created by Ivan Sapozhnik on 11/9/18.
//

import Vapor
import Fluent

final class AppInfoController {
    func index(_ req: Request) throws -> Future<[AppInfo]> {
        return AppInfo.query(on: req).all()
    }
    
    func crash(_ req: Request) throws -> Future<Crash> {
        let android = AppInfo.query(on: req).filter(\.platform == "android").count()
        return AppInfo.query(on: req).filter(\.platform == "ios").count().and(android).map { (ios, android) -> Crash in
            return Crash(iosCount: ios, androidCount: android)
        }
    }
    
    func createIOSCrashProd(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.ios.rawValue
            appInfo.app = App.prod.rawValue
            return appInfo.save(on: req)
        }
    }
    
    func createIOSCrashAlpha(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.ios.rawValue
            appInfo.app = App.alpha.rawValue
            return appInfo.save(on: req)
        }
    }
    
    func createIOSCrashBeta(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.ios.rawValue
            appInfo.app = App.beta.rawValue
            return appInfo.save(on: req)
        }
    }
    
    func createIOSCrashDev(_ req: Request) throws -> Future<AppInfo> {
        print("CRASH!")
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.ios.rawValue
            appInfo.app = App.dev.rawValue
            return appInfo.save(on: req)
        }
    }
    
    ////////////////////
    
    func createAndroidCrashProd(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.android.rawValue
            appInfo.app = App.prod.rawValue
            return appInfo.save(on: req)
        }
    }
    
    func createAndroidCrashAlpha(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.android.rawValue
            appInfo.app = App.alpha.rawValue
            return appInfo.save(on: req)
        }
    }
    
    func createAndroidCrashBeta(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.android.rawValue
            appInfo.app = App.beta.rawValue
            return appInfo.save(on: req)
        }
    }
    
    func createAndroidCrashDev(_ req: Request) throws -> Future<AppInfo> {
        return try req.content.decode(AppInfo.self).flatMap { appInfo in
            appInfo.platform = Platform.android.rawValue
            appInfo.app = App.dev.rawValue
            return appInfo.save(on: req)
        }
    }
}
