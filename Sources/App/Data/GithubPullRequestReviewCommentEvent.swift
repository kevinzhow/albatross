import Foundation

struct GithubPullRequestReviewCommentEvent: Codable {
  let action: String
  let changes: Change
  let comment: GithubEvent.Comment
  let pullRequest: GithubPullRequestEvent.PullRequest
  let repository: GithubEvent.Repository
  let sender: GithubEvent.Sender

  private enum CodingKeys: String, CodingKey {
    case action
    case changes
    case comment
    case pullRequest = "pull_request"
    case repository
    case sender
  }
}

extension GithubPullRequestReviewCommentEvent {
  struct Change: Codable {
    let body: Body
  }
}

extension GithubPullRequestReviewCommentEvent.Change {
  struct Body: Codable {
    let from: String
  }
}
