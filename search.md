---
layout: page
title: Поиск
permalink: /search/
disableOrphus: true
disableComments: true
---


<div id="sp-search">
  <input type="text" class="sp-query" placeholder="введите поисковый зпрос" value="" /> <input type="submit" value="Найти" class="sp-find-button" />
  <span class="sp-status"></span>
  <br />
  <span class="sp-results"></span>
</div>

<script type="text/javascript" src="http://svoy-poisk.sergei-udalov.ru/js/search.js"></script>

<script type="text/javascript">
  var search;

  search = new sp_Poisk({ sitemap_url: "http://www.sergei-udalov.ru/sitemap.xml", el: "#sp-search" });

  jQuery("#sp-search .sp-find-button").click(function() {
    var q = jQuery("#sp-search .sp-query").val();
    search.find(q);
  });

</script>

