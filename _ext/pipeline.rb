require 'authors_helper'
require 'wget_wrapper'
require 'js_minifier'
require 'css_minifier'
require 'html_minifier'

Awestruct::Extensions::Pipeline.new do
  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics
  helper Awestruct::Extensions::AuthorsHelper
  extension Awestruct::Extensions::Posts.new '/blog'
  #extension Awestruct::Extensions::Paginator.new :posts, '/blog', :page_name => '/blog/', :per_page => 5
  #extension Awestruct::Extensions::Tagger.new :posts, '/blog', '/blog/tag', :page_name => '/', :per_page => 10
  extension Awestruct::Extensions::Indexifier.new
  #extension Awestruct::Extensions::Atomizer.new :posts, '/feed.atom', :template => '_layouts/feed.atom.haml'
  extension Awestruct::Extensions::Disqus.new
 
  extension Awestruct::Extensions::WgetWrapper.new
  transformer Awestruct::Extensions::JsMinifier.new
  transformer Awestruct::Extensions::CssMinifier.new
  transformer Awestruct::Extensions::HtmlMinifier.new
end
