xml.instruct! :xml, :version=>"1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @page_title
    xml.description "Galleria Macondo"
    xml.link formatted_gallery_index_url(:rss)

    for painting in @paintings
      xml.item do
        xml.title(painting.title)
        xml.description("by #{painting.artists.map{ |artist| artist.name }}")
        xml.pubDate(painting.created_at.to_s(:rfc822))
        xml.link gallery_url(painting)
      end
    end
  end
end
