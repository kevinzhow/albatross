//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

struct GithubIssueCommentEvent: Codable {
    let action: String
    let issue: Issue
    let comment: Comment
    let repository: GithubEvent.Repository
    let sender: GithubEvent.Sender
}

extension GithubIssueCommentEvent {
    struct Issue: Codable {
        let url: URL
        let repositoryURL: URL
        let labelsURL: String
        let commentsURL: URL
        let eventsURL: URL
        let htmlURL: URL
        let id: Date
        let nodeID: String
        let number: Int
        let title: String
        let user: User
        let labels: [Label]
        let state: String
        let locked: Bool
        let assignee: Assignee
        let assignees: [Assignee]
        let milestone: Milestone
        let comments: Int
        let createdAt: Date
        let updatedAt: Date
//        let closedAt: Any?
        let authorAssociation: String
//        let activeLockReason: Any?
        let body: String
        let reactions: Reaction
        let timelineURL: URL
//        let performedViaGithubApp: Any?

        private enum CodingKeys: String, CodingKey {
            case url
            case repositoryURL = "repository_url"
            case labelsURL = "labels_url"
            case commentsURL = "comments_url"
            case eventsURL = "events_url"
            case htmlURL = "html_url"
            case id
            case nodeID = "node_id"
            case number
            case title
            case user
            case labels
            case state
            case locked
            case assignee
            case assignees
            case milestone
            case comments
            case createdAt = "created_at"
            case updatedAt = "updated_at"
//            case closedAt = "closed_at"
            case authorAssociation = "author_association"
//            case activeLockReason = "active_lock_reason"
            case body
            case reactions
            case timelineURL = "timeline_url"
//            case performedViaGithubApp = "performed_via_github_app"
        }
    }
}

extension GithubIssueCommentEvent.Issue {
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

extension GithubIssueCommentEvent.Issue {
    struct Label: Codable {
        let id: Date
        let nodeID: String
        let url: URL
        let name: String
        let color: String
        let `default`: Bool
        let description: String

        private enum CodingKeys: String, CodingKey {
            case id
            case nodeID = "node_id"
            case url
            case name
            case color
            case `default`
            case description
        }
    }
}

extension GithubIssueCommentEvent.Issue {
    struct Assignee: Codable {
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

extension GithubIssueCommentEvent.Issue {
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

extension GithubIssueCommentEvent.Issue.Milestone {
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

extension GithubIssueCommentEvent {
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

extension GithubIssueCommentEvent {
    struct Comment: Codable {
        let url: URL
        let htmlURL: URL
        let issueURL: URL
        let id: Date
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
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case authorAssociation = "author_association"
            case body
            case reactions
//            case performedViaGithubApp = "performed_via_github_app"
        }
    }
}

extension GithubIssueCommentEvent.Comment {
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
