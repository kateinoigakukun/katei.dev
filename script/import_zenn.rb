#!/usr/bin/env ruby

require "fileutils"
require "json"
require "open-uri"
require "time"

username = ARGV.fetch(0, "katei")
output_dir = ARGV.fetch(1, "_external_posts")
endpoint = "https://zenn.dev/api/articles?username=#{URI.encode_www_form_component(username)}&order=latest"
articles = JSON.parse(URI.open(endpoint, read_timeout: 20).read).fetch("articles")

FileUtils.mkdir_p(output_dir)
imported = 0

articles.each do |article|
  next if article["is_suspending_private"]

  url = "https://zenn.dev#{article.fetch("path")}"
  existing_file = Dir[File.join(output_dir, "*")].find { |file| File.read(file).include?(url) }
  filename = existing_file || File.join(output_dir, "zenn-#{article.fetch("slug")}.md")
  date = Time.iso8601(article.fetch("published_at"))
  title = article.fetch("title").gsub("\\", "\\\\").gsub('"', '\\"')

  File.write(filename, <<~YAML)
    ---
    title: "#{title}"
    date: #{date.strftime("%Y-%m-%d %H:%M:%S %z")}
    language: ja
    publisher: Zenn
    source: zenn
    external_url: #{url}
    ---
  YAML
  imported += 1
end

puts "Imported #{imported} Zenn articles for #{username}"
