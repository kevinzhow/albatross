//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

/// Related to issue
struct GithubIssueEvent: Codable {
    let action: String
    let issue: GithubEvent.Issue
    let repository: GithubEvent.Repository
    let sender: GithubEvent.Sender
}

struct GithubEvent {
    struct Issue: Codable {
        let url: URL
        let repositoryURL: URL
        let labelsURL: String
        let commentsURL: URL
        let eventsURL: URL
        let htmlURL: URL
        let id: Int
        let nodeID: String
        let number: Int
        let title: String
        let user: User
        let labels: [Label]
        let state: String
        let locked: Bool
        let assignee: Assignee?
        let assignees: [Assignee]
        let milestone: Milestone?
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



