require 'rho/rhocontroller'
require 'helpers/browser_helper'

class NewsController < Rho::RhoController
  include BrowserHelper

  #GET /News
  def index
    @news = News.find(:all)
    
    render
  end

  # GET /News/{1}
  def show
    @news = News.find(@params['id'])
    if @news
      render :action => :show
    else
      redirect :action => :index
    end
  end
  
  def update
    News.delete_all
    get_posts
    @news = News.find(:all)
    
    render :action => :index
  end
  
  def get_posts
    html = Rho::AsyncHttp.get(:url => 'http://www.jdcwest.com/pages/blog.html')['body']
        
    html.scan(/<div id="blogpost(\d)" class="article">(.+)<!-- ending blogpost\1 -->/im).each do |match|
      post    = match[1]
      
      title   = post.scan(/<h3 id="blogtitle">(.+)<\/h3>/im)[0][0]
      date    = post.scan(/<h4 id="blogdate">(.+)<\/h4>/im)[0][0]
      author  = post.scan(/<div id="blogfooter">.+<p id="blogfoottext">Posted by (.+)<\/p>.+<\/div>/im)[0][0]
      body    = post.scan(/<h3 id="blogtitle">#{title}<\/h3>.+<h4 id="blogdate">#{date}<\/h4>(.+)<div id="blogfooter">.+<p id="blogfoottext">Posted by #{author}<\/p>.+<\/div>/im)[0][0]
      body.strip!
      
      News.create(:title => title, :date => date, :body => body, :author => author)
    end
  end
end