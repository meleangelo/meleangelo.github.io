```{=html}
<ol class="news-list list">
<% for (const item of items) { %>
  <li class="news-item" <%= metadataAttrs(item) %>>
    <div class="news-date listing-date"><%= item.date_label %></div>
    <div class="news-body listing-title">
      <% if (item.url) { %><a href="<%- item.url %>"><%= item.title %></a><% } else { %><%= item.title %><% } %>
    </div>
  </li>
<% } %>
</ol>
```
