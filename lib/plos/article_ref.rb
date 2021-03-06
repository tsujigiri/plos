module PLOS
  class ArticleRef
    include PLOS::XmlHelpers

    attr_accessor :node
    attr_accessor :client
    attr_accessor :score
    attr_accessor :type
    attr_accessor :authors
    attr_accessor :eissn
    attr_accessor :id
    attr_accessor :journal
    attr_accessor :published_at
    attr_accessor :title
    attr_accessor :abstract

    alias :article_type= :type=
    alias :author_display= :authors=
    alias :title_display= :title=
    alias :publication_date= :published_at=

    def initialize(client, node)
      self.node = node

      self.client = client
      node.xpath('./*').each do |child|
        parse_node(child, self)
      end
    end

    def article_id
      id.split("/")[0..1].join("/") if id
    end

    def article_part
      id.split("/")[2] if id
    end

    def article
      @article ||= PLOS::Article.get(article_id)
    end

    def citation(format="RIS")
      PLOS::Article.citation(id, format)
    end
  end
end
