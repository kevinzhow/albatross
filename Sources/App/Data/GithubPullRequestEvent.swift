//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

struct GithubPullRequestEvent: Codable {
    let action: String
    let number: Int
    let pullRequest: PullRequest
    let repository: GithubEvent.Repository
    let sender: GithubEvent.Sender

    private enum CodingKeys: String, CodingKey {
        case action
        case number
        case pullRequest = "pull_request"
        case repository
        case sender
    }
}

extension GithubPullRequestEvent {
    struct PullRequest: Codable {
        let url: URL
        let id: Int
        let nodeID: String
        let htmlURL: URL
        let diffURL: URL
        let patchURL: URL
        let issueURL: URL
        let number: Int
        let state: String
        let locked: Bool
        let title: String
        let user: User
        let body: String?
        let createdAt: Date
        let updatedAt: Date
//        let closedAt: Any?
//        let mergedAt: Any?
//        let mergeCommitSha: Any?
//        let assignee: Any?
//        let assignees: [Any]
//        let requestedReviewers: [Any]
//        let requestedTeams: [Any]
//        let labels: [Any]
//        let milestone: Any?
        let draft: Bool
        let commitsURL: URL
        let reviewCommentsURL: URL
        let reviewCommentURL: String
        let commentsURL: URL
        let statusesURL: URL
        let head: Head
        let base: Base
//        let links: Link
        let authorAssociation: String
//        let autoMerge: Any?
//        let activeLockReason: Any?
        let merged: Bool
//        let mergeable: Any?
//        let rebaseable: Any?
        let mergeableState: String
//        let mergedBy: Any?
        let comments: Int
        let reviewComments: Int
        let maintainerCanModify: Bool
        let commits: Int
        let additions: Int
        let deletions: Int
        let changedFiles: Int

        private enum CodingKeys: String, CodingKey {
            case url
            case id
            case nodeID = "node_id"
            case htmlURL = "html_url"
            case diffURL = "diff_url"
            case patchURL = "patch_url"
            case issueURL = "issue_url"
            case number
            case state
            case locked
            case title
            case user
            case body
            case createdAt = "created_at"
            case updatedAt = "updated_at"
//            case closedAt = "closed_at"
//            case mergedAt = "merged_at"
//            case mergeCommitSha = "merge_commit_sha"
//            case assignee
//            case assignees
//            case requestedReviewers = "requested_reviewers"
//            case requestedTeams = "requested_teams"
//            case labels
//            case milestone
            case draft
            case commitsURL = "commits_url"
            case reviewCommentsURL = "review_comments_url"
            case reviewCommentURL = "review_comment_url"
            case commentsURL = "comments_url"
            case statusesURL = "statuses_url"
            case head
            case base
//            case links = "_links"
            case authorAssociation = "author_association"
//            case autoMerge = "auto_merge"
//            case activeLockReason = "active_lock_reason"
            case merged
//            case mergeable
//            case rebaseable
            case mergeableState = "mergeable_state"
//            case mergedBy = "merged_by"
            case comments
            case reviewComments = "review_comments"
            case maintainerCanModify = "maintainer_can_modify"
            case commits
            case additions
            case deletions
            case changedFiles = "changed_files"
        }
    }
}

extension GithubPullRequestEvent.PullRequest {
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

extension GithubPullRequestEvent.PullRequest {
    struct Head: Codable {
        let label: String
        let ref: String
        let sha: String
        let user: User
        let repo: Repo
    }
}


extension GithubPullRequestEvent.PullRequest {
    struct Repo: Codable {
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
        let createdAt: Date
        let updatedAt: Date
        let pushedAt: Date
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
        let allowSquashMerge: Bool
        let allowMergeCommit: Bool
        let allowRebaseMerge: Bool
        let allowAutoMerge: Bool
        let deleteBranchOnMerge: Bool
        let allowUpdateBranch: Bool

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
            case allowSquashMerge = "allow_squash_merge"
            case allowMergeCommit = "allow_merge_commit"
            case allowRebaseMerge = "allow_rebase_merge"
            case allowAutoMerge = "allow_auto_merge"
            case deleteBranchOnMerge = "delete_branch_on_merge"
            case allowUpdateBranch = "allow_update_branch"
        }
    }
}

extension GithubPullRequestEvent.PullRequest.Repo {
    struct Owner: Codable {
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

extension GithubPullRequestEvent.PullRequest {
    struct Base: Codable {
        let label: String
        let ref: String
        let sha: String
        let user: User
        let repo: Repo
    }
}

extension GithubPullRequestEvent.PullRequest.Base {
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

