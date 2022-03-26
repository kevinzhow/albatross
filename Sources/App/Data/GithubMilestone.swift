//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

extension GithubEvent.Issue {
    struct Milestone: Codable {
        let url: URL
        let htmlURL: URL
        let labelsURL: URL
        let id: Int
        let nodeID: String
        let number: Int
        let title: String
//        let description: Any?
        let creator: Creator
        let openIssues: Int
        let closedIssues: Int
        let state: String
        let createdAt: Date
        let updatedAt: Date
//        let dueOn: Any?
//        let closedAt: Any?

        private enum CodingKeys: String, CodingKey {
            case url
            case htmlURL = "html_url"
            case labelsURL = "labels_url"
            case id
            case nodeID = "node_id"
            case number
            case title
//            case description
            case creator
            case openIssues = "open_issues"
            case closedIssues = "closed_issues"
            case state
            case createdAt = "created_at"
            case updatedAt = "updated_at"
//            case dueOn = "due_on"
//            case closedAt = "closed_at"
        }
    }
}


extension GithubEvent.Issue.Milestone {
    struct Creator: Codable {
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
