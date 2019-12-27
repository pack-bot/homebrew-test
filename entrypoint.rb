#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "octokit"

path = ENV["GITHUB_EVENT_PATH"]
repo = ENV["GITHUB_REPOSITORY"]
token = ENV["INPUT_GITHUB_TOKEN"]
json = File.read(path)
event = JSON.parse(json)
client = Octokit::Client.new(:access_token => token)
number = event["number"]
added = event["commits"].any? do |commit|
  commit = client.commit(repo, commit["id"])
  added = commit["files"].any? do |file|
    next unless file["status"] == "added"
    next unless file["filename"].start_with?("Formula/")

    return true
  end

  return true if added
end

if added
  client.update_issue(repo, number, :labels => "new formula")
end
