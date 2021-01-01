#!/usr/bin/env ruby
# frozen_string_literal: false

require "linguist"
require "rugged"
require "json"
require "optparse"

path = ARGV[0] || Dir.pwd

ARGV.shift
percentage = ARGV[0] == "true"

if File.directory?(path)
  rugged = Rugged::Repository.new(path)
  repo = Linguist::Repository.new(rugged, rugged.head.target_id)

  data = Hash.new
  repo.languages.sort_by { |_, size| size }.reverse_each do |language, size|
    value = (size / repo.size.to_f)
    if percentage
      value *= 100
      value = sprintf "%.2f" % value
      value = "#{value}%"
    end
    data[language] = value
  end
  puts JSON.generate(data)
elsif File.file?(path)
  blob = Linguist::FileBlob.new(path, Dir.pwd)

  type = if blob.text?
    "Text"
  elsif blob.image?
    "Image"
  else
    "Binary"
  end

  json = Hash.new
  json["lines"] = blob.loc
  json["sloc"] = blob.sloc
  json["type"] = type
  json["mime_type"] = blob.mime_type
  json["language"] = blob.language
  puts JSON.generate({
    blob.name => json
  })
else
  abort <<-HELP
  Linguist v#{Linguist::VERSION}
  Detect language type for a file, or, given a repository, determine language breakdown.

  Usage: ruby linguist.rb <path>
         ruby linguist.rb <path> [percentage]
  HELP
end
