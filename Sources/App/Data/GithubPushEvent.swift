//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

struct GithubPushEvent: Codable {
    let ref: String
    let before: String
    let after: String
    let repository: GithubEvent.Repository
    let pusher: Pusher
    let sender: GithubEvent.Sender
    let created: Bool
    let deleted: Bool
    let forced: Bool
//    let baseRef: Any?
    let compare: URL
    let commits: [Commit]
    let headCommit: HeadCommit

    private enum CodingKeys: String, CodingKey {
        case ref
        case before
        case after
        case repository
        case pusher
        case sender
        case created
        case deleted
        case forced
//        case baseRef = "base_ref"
        case compare
        case commits
        case headCommit = "head_commit"
    }
}

extension GithubEvent {
    struct Repository: Codable {
        let id: Int
        let nodeID: String
        let name: String
        let fullName: String
        let `private`: Bool
        let owner: Owner
        let htmlURL: URL
        let description: String
        let fork: Bool
        let url: URL
        let forksURL: URL
        let keysURL: String
        let collaboratorsURL: String
        let teamsURL: URL
        let hooksURL: URL
        let issueEventsURL: String
        let eventsURL: URL
        let assigneesURL: String
        let branchesURL: String
        let tagsURL: URL
        let blobsURL: String
        let gitTagsURL: String
        let gitRefsURL: String
        let treesURL: String
        let statusesURL: String
        let languagesURL: URL
        let stargazersURL: URL
        let contributorsURL: URL
        let subscribersURL: URL
        let subscriptionURL: URL
        let commitsURL: String
        let gitCommitsURL: String
        let commentsURL: String
        let issueCommentURL: String
        let contentsURL: String
        let compareURL: String
        let mergesURL: URL
        let archiveURL: String
        let downloadsURL: URL
        let issuesURL: String
        let pullsURL: String
        let milestonesURL: String
        let notificationsURL: String
        let labelsURL: String
        let releasesURL: String
        let deploymentsURL: URL
        let createdAt: Double
        let updatedAt: Date
        let pushedAt: Double
        let gitURL: URL
        let sshURL: String
        let cloneURL: URL
        let svnURL: URL
//        let homepage: Any?
        let size: Int
        let stargazersCount: Int
        let watchersCount: Int
        let language: String
        let hasIssues: Bool
        let hasProjects: Bool
        let hasDownloads: Bool
        let hasWiki: Bool
        let hasPages: Bool
        let forksCount: Int
//        let mirrorURL: Any?
        let archived: Bool
        let disabled: Bool
        let openIssuesCount: Int
//        let license: Any?
        let allowForking: Bool
        let isTemplate: Bool
//        let topics: [Any]
        let visibility: String
        let forks: Int
        let openIssues: Int
        let watchers: Int
        let defaultBranch: String
        let stargazers: Int
        let masterBranch: String

        private enum CodingKeys: String, CodingKey {
            case id
            case nodeID = "node_id"
            case name
            case fullName = "full_name"
            case `private`
            case owner
            case htmlURL = "html_url"
            case description
            case fork
            case url
            case forksURL = "forks_url"
            case keysURL = "keys_url"
            case collaboratorsURL = "collaborators_url"
            case teamsURL = "teams_url"
            case hooksURL = "hooks_url"
            case issueEventsURL = "issue_events_url"
            case eventsURL = "events_url"
            case assigneesURL = "assignees_url"
            case branchesURL = "branches_url"
            case tagsURL = "tags_url"
            case blobsURL = "blobs_url"
            case gitTagsURL = "git_tags_url"
            case gitRefsURL = "git_refs_url"
            case treesURL = "trees_url"
            case statusesURL = "statuses_url"
            case languagesURL = "languages_url"
            case stargazersURL = "stargazers_url"
            case contributorsURL = "contributors_url"
            case subscribersURL = "subscribers_url"
            case subscriptionURL = "subscription_url"
            case commitsURL = "commits_url"
            case gitCommitsURL = "git_commits_url"
            case commentsURL = "comments_url"
            case issueCommentURL = "issue_comment_url"
            case contentsURL = "contents_url"
            case compareURL = "compare_url"
            case mergesURL = "merges_url"
            case archiveURL = "archive_url"
            case downloadsURL = "downloads_url"
            case issuesURL = "issues_url"
            case pullsURL = "pulls_url"
            case milestonesURL = "milestones_url"
            case notificationsURL = "notifications_url"
            case labelsURL = "labels_url"
            case releasesURL = "releases_url"
            case deploymentsURL = "deployments_url"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case pushedAt = "pushed_at"
            case gitURL = "git_url"
            case sshURL = "ssh_url"
            case cloneURL = "clone_url"
            case svnURL = "svn_url"
//            case homepage
            case size
            case stargazersCount = "stargazers_count"
            case watchersCount = "watchers_count"
            case language
            case hasIssues = "has_issues"
            case hasProjects = "has_projects"
            case hasDownloads = "has_downloads"
            case hasWiki = "has_wiki"
            case hasPages = "has_pages"
            case forksCount = "forks_count"
//            case mirrorURL = "mirror_url"
            case archived
            case disabled
            case openIssuesCount = "open_issues_count"
//            case license
            case allowForking = "allow_forking"
            case isTemplate = "is_template"
//            case topics
            case visibility
            case forks
            case openIssues = "open_issues"
            case watchers
            case defaultBranch = "default_branch"
            case stargazers
            case masterBranch = "master_branch"
        }
    }
}

extension GithubEvent.Repository {
    struct Owner: Codable {
        let name: String
        let email: String
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
            case name
            case email
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

extension GithubPushEvent {
    struct Pusher: Codable {
        let name: String
        let email: String
    }
}

struct GithubEvent {
    struct Sender: Codable {
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

extension GithubPushEvent {
    struct Commit: Codable {
        let id: String
        let treeID: String
        let distinct: Bool
        let message: String
        let timestamp: Date
        let url: URL
        let author: Author
        let committer: Committer
//        let added: [Any]
//        let removed: [Any]
        let modified: [String]

        private enum CodingKeys: String, CodingKey {
            case id
            case treeID = "tree_id"
            case distinct
            case message
            case timestamp
            case url
            case author
            case committer
//            case added
//            case removed
            case modified
        }
    }
}

extension GithubPushEvent.Commit {
    struct Author: Codable {
        let name: String
        let email: String
        let username: String
    }
}

extension GithubPushEvent.Commit {
    struct Committer: Codable {
        let name: String
        let email: String
        let username: String
    }
}

extension GithubPushEvent {
    struct HeadCommit: Codable {
        let id: String
        let treeID: String
        let distinct: Bool
        let message: String
        let timestamp: Date
        let url: URL
        let author: Author
        let committer: Committer
//        let added: [Any]
//        let removed: [Any]
        let modified: [String]

        private enum CodingKeys: String, CodingKey {
            case id
            case treeID = "tree_id"
            case distinct
            case message
            case timestamp
            case url
            case author
            case committer
//            case added
//            case removed
            case modified
        }
    }
}

extension GithubPushEvent.HeadCommit {
    struct Author: Codable {
        let name: String
        let email: String
        let username: String
    }
}

extension GithubPushEvent.HeadCommit {
    struct Committer: Codable {
        let name: String
        let email: String
        let username: String
    }
}
