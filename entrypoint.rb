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
files = client.pull_request_files(repo, number)
added = files.any? do |file|
  next unless file["status"] == "added"
  next unless file["filename"].start_with?("Formula/")

  break true
end

if added
  puts "==> New formula PR"
  client.update_issue(repo, number, :labels => "new formula,")
else
  puts "==> Not a new formula PR"
end
