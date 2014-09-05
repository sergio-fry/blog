module Jekyll
  class Embedly < Liquid::Tag

    def initialize(tag_name, url, tokens)
       super
       @url = url
    end
    
    def render(context)
      <<-HTML
<a class="embedly-card" data-card-chrome="0" href="#{@url}">#{@url}</a>

<script>!function(a){var b="embedly-platform",c="script";if(!a.getElementById(b)){var d=a.createElement(c);d.id=b,d.src=("https:"===document.location.protocol?"https":"http")+"://cdn.embedly.com/widgets/platform.js";var e=document.getElementsByTagName(c)[0];e.parentNode.insertBefore(d,e)}}(document);</script>
      HTML
    end
  end
end

Liquid::Template.register_tag('embedly', Jekyll::Embedly)

