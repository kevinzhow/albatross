//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

extension GithubEvent {
    struct Comment: Codable {
        let url: URL
        let htmlURL: URL
        let issueURL: URL?
        let id: Int
        let path: String?
        let line: Int?
        let nodeID: String
        let user: User
        let createdAt: Date
        let updatedAt: Date
        let authorAssociation: String
        let body: String
        let reactions: Reaction
//        let performedViaGithubApp: Any?

        private enum CodingKeys: String, CodingKey {
            case url
            case htmlURL = "html_url"
            case issueURL = "issue_url"
            case id
            case nodeID = "node_id"
            case user
            case path
            case line
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case authorAssociation = "author_association"
            case body
            case reactions
//            case performedViaGithubApp = "performed_via_github_app"
        }
    }
}

extension GithubEvent.Comment {
    struct User: Codable {
        let login: String
        let id: Int
        let nodeID: String
        let avatarURL: URL
        let gravatarID: String
        let url: URL
        let htmlURL: URL
        let followersURL: URL
        let followingURL: String
        let gistsURL: String
        let starredURL: String
        let subscriptionsURL: URL
        let organizationsURL: URL
        let reposURL: URL
        let eventsURL: String
        let receivedEventsURL: URL
        let type: String
        let siteAdmin: Bool

        private enum CodingKeys: String, CodingKey {
            case login
            case id
            case nodeID = "node_id"
            case avatarURL = "avatar_url"
            case gravatarID = "gravatar_id"
            case url
            case htmlURL = "html_url"
            case followersURL = "followers_url"
            case followingURL = "following_url"
            case gistsURL = "gists_url"
            case starredURL = "starred_url"
            case subscriptionsURL = "subscriptions_url"
            case organizationsURL = "organizations_url"
            case reposURL = "repos_url"
            case eventsURL = "events_url"
            case receivedEventsURL = "received_events_url"
            case type
            case siteAdmin = "site_admin"
        }
    }
}

extension GithubEvent.Comment {
    struct Reaction: Codable {
        let url: URL
        let totalCount: Int
        let add1: Int
        let minus1: Int
        let laugh: Int
        let hooray: Int
        let confused: Int
        let heart: Int
        let rocket: Int
        let eyes: Int

        private enum CodingKeys: String, CodingKey {
            case url
            case totalCount = "total_count"
            case add1 = "+1"
            case minus1 = "-1"
            case laugh
            case hooray
            case confused
            case heart
            case rocket
            case eyes
        }
    }
}
