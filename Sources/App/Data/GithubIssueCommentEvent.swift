//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

struct GithubIssueCommentEvent: Codable {
    let action: String
    let issue: GithubEvent.Issue
    let comment: GithubEvent.Comment
    let repository: GithubEvent.Repository
    let sender: GithubEvent.Sender
}
