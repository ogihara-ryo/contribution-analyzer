# Contribution Analyzer

This web application uses the GitHub API to visualize the developer's contribution to the organization product.

## DEMO

![DEMO](https://user-images.githubusercontent.com/11517870/114265752-8d507c00-9a2d-11eb-93f9-06c6856567b3.png)

## Requirement

- Ruby 3.0.1
- Ruby on Rails 6.1.3

## Setup

### Install

```zsh
% git clone git@github.com:ogihara-ryo/contribution-analyzer.git
% cd contribution-analyzer
% bundle
```

### Database

```zsh
% rails db:create
% rails db:migrate
```

### Start server

```zsh
% rails s
```

## Usage

### Environment Variable

Set the name of the GitHub's organization for which you want to analyze the contribution to `CONTRIBUTION_ANALYZER_ORG_NAME`. Set GitHub's personal access token to access this organization in `CONTRIBUTION_ANALYZER_GITHUB_PERSONAL_ACCESS_TOKEN`.

```zsh
% export CONTRIBUTION_ANALYZER_GITHUB_PERSONAL_ACCESS_TOKEN="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
% export CONTRIBUTION_ANALYZER_ORG_NAME="orgname"
```

## GitHub API

Use these [GitHub APIs](https://docs.github.com/en/rest)

- [List organization repositories](https://docs.github.com/en/rest/reference/repos#list-organization-repositories)
- [List repository events](https://docs.github.com/en/rest/reference/activity#list-repository-events)

## Note


These are a list of events to save

- IssuesEvent
- IssueCommentEvent
- PullRequestEvent
- PullRequestReviewEvent
- PullRequestReviewCommentEvent
- GollumEvent (Maintenance Wiki)

These are a list of events that you do not want to save

- Create Event (Create Branch)
- Delete Event (Delete Branch)
- Push Event
