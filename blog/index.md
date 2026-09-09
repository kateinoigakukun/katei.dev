---
layout: default
title: Blog
---
<section>
  <h1>Blog</h1>
  <p><a href="{{ '/blog/ja/' | relative_url }}">日本語</a> · <a href="{{ '/blog/en/' | relative_url }}">English</a></p>
  <ul class="post-list">
    {% assign posts = site.posts | concat: site.external_posts | sort: 'date' | reverse %}
    {% for post in posts %}
      <li>
        <time class="post-meta" datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
        · <span class="post-meta">{{ post.language | upcase }}</span>
        <br>{% if post.external_url %}<a href="{{ post.external_url }}" target="_blank" rel="noopener noreferrer">{{ post.title }} ↗</a>{% else %}<a href="{{ post.url | relative_url }}">{{ post.title }}</a>{% endif %}
        {% if post.external_url %}<p>Published at {{ post.publisher }}</p>{% elsif post.excerpt %}<p>{{ post.excerpt | strip_html | truncate: 180 }}</p>{% endif %}
      </li>
    {% endfor %}
  </ul>
</section>
