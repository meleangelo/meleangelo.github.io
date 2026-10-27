```{=html}
<ol class="pub-list list">
<% for (const item of items) { %>
  <li class="pub-item" <%= metadataAttrs(item) %>>
    <div class="pub-title listing-title"><%= item.title %></div>
    <div class="pub-meta">
      <span class="listing-authors"><%= item.authors %></span>
      <% if (item.year) { %><span class="listing-year"> · <%= item.year %></span><% } %>
    </div>
    <div class="pub-venue">
      <em><%= item.venue %></em><% if (item.venue_detail) { %>, <%= item.venue_detail %><% } %>
    </div>
    <% if (item.note) { %><p class="pub-note"><%= item.note %></p><% } %>
    <p class="pub-links">
      <% if (item.paper) { %><a href="<%- item.paper %>">Paper</a><% } %>
      <% if (item.doi) { %><a href="<%- item.doi %>">DOI</a><% } %>
      <% if (item.preprint) { %><a href="<%- item.preprint %>">Preprint</a><% } %>
      <% if (item.code) { %><a href="<%- item.code %>">Code</a><% } %>
      <% if (item.extra_url_1) { %><a href="<%- item.extra_url_1 %>"><%= item.extra_label_1 || "Supplement" %></a><% } %>
      <% if (item.extra_url_2) { %><a href="<%- item.extra_url_2 %>"><%= item.extra_label_2 || "Supplement" %></a><% } %>
      <% if (item.extra_url_3) { %><a href="<%- item.extra_url_3 %>"><%= item.extra_label_3 || "Supplement" %></a><% } %>
      <% if (item.extra_url_4) { %><a href="<%- item.extra_url_4 %>"><%= item.extra_label_4 || "Supplement" %></a><% } %>
      <% if (item.extra_url_5) { %><a href="<%- item.extra_url_5 %>"><%= item.extra_label_5 || "Supplement" %></a><% } %>
    </p>
    <% if (item.topics) { %>
    <p class="pub-topics">
      <% for (const topic of item.topics) { %><span class="topic-label"><%= topic %></span><% } %>
    </p>
    <% } %>
  </li>
<% } %>
</ol>
```
