//
//  File.swift
//  File
//
//  Created by 周楷雯 on 2021/7/31.
//

import Vapor

struct AdminPasswordAuthenticator: AsyncMiddleware {
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
    
        guard let basic = request.headers.basicAuthorization,
          basic.username == request.adminConfig.username && basic.password == request.adminConfig.password else {
              throw Abort(.unauthorized)
    }

    return try await next.respond(to: request)
  }
}

struct AdminConfigurationKey: StorageKey {
    typealias Value = AdminConfiguration
}

struct AdminConfiguration {
  let username: String
  let password: String
}

extension Application {
    var adminConfig: AdminConfiguration {
        get {
          if let config = self.storage[AdminConfigurationKey.self] {
            return config
          } else {
              fatalError("Missing Admin Config")
          }
        }
        set {
            self.storage[AdminConfigurationKey.self] = newValue
        }
    }
}

extension Request {
  var adminConfig: AdminConfiguration {
      get {
        return self.application.adminConfig
      }
  }
}
