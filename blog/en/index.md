---
layout: default
title: English posts
language: en
---
<section>
  <p class="eyebrow">Writing · English</p>
  <h1>English posts</h1>
  <ul class="post-list">
    {% assign posts = site.posts | concat: site.external_posts | where: "language", "en" | sort: "date" | reverse %}
    {% for post in posts %}
      <li><time class="post-meta" datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time><br>{% if post.external_url %}<a href="{{ post.external_url }}" target="_blank" rel="noopener noreferrer">{{ post.title }} ↗</a><p>Published at {{ post.publisher }}</p>{% else %}<a href="{{ post.url | relative_url }}">{{ post.title }}</a>{% endif %}</li>
    {% endfor %}
  </ul>
</section>
