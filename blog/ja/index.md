---
layout: default
title: 日本語の記事
language: ja
---
<section>
  <h1>日本語の記事</h1>
  <p><a href="{{ '/blog/ja/' | relative_url }}">日本語</a> · <a href="{{ '/blog/en/' | relative_url }}">English</a></p>
  <ul class="post-list">
    {% assign posts = site.posts | concat: site.external_posts | where: "language", "ja" | sort: "date" | reverse %}
    {% for post in posts %}
      <li><time class="post-meta" datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time><br>{% if post.external_url %}<a href="{{ post.external_url }}" target="_blank" rel="noopener noreferrer">{{ post.title }} ↗</a><p>Published at {{ post.publisher }}</p>{% else %}<a href="{{ post.url | relative_url }}">{{ post.title }}</a>{% endif %}</li>
    {% endfor %}
  </ul>
</section>
