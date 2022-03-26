//
//  File.swift
//  
//
//  Created by kevinzhow on 2022/3/26.
//

import Foundation

struct GithubCommitCommentEvent: Codable {
    let action: String
    let comment: GithubEvent.Comment
    let repository: GithubEvent.Repository
    let sender: GithubEvent.Sender
}
