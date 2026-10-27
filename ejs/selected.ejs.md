```{=html}
<ol class="selected-list list">
<% for (const item of items) { %>
  <li class="selected-item" <%= metadataAttrs(item) %>>
    <div class="selected-kicker">
      <% if (item.status === "published") { %><%= item.venue %>, <%= item.year %><% } else { %><%= item.venue %><% } %>
    </div>
    <h3 class="listing-title selected-title"><%= item.title %></h3>
    <p class="selected-authors listing-authors"><%= item.authors %></p>
    <% if (item.featured_summary) { %><p class="selected-summary"><%= item.featured_summary %></p><% } %>
    <p class="pub-links">
      <% if (item.paper) { %><a href="<%- item.paper %>">Paper</a><% } %>
      <% if (item.doi) { %><a href="<%- item.doi %>">DOI</a><% } %>
      <% if (item.preprint) { %><a href="<%- item.preprint %>">Preprint</a><% } %>
      <% if (item.code) { %><a href="<%- item.code %>">Code</a><% } %>
    </p>
  </li>
<% } %>
</ol>
```
