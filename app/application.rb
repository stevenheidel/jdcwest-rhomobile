require 'rho/rhoapplication'
require 'rho/rhoutils'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = [
      { :label => "Countdown", :action => '/app', 
          :icon => "/public/images/tabs/11-clock.png", :reload => true }, 
      { :label => "News",  :action => "http://www.jdcwest.com/pages/blog.html",#'/app/News',  
          :icon => "/public/images/tabs/18-envelope.png" },
      { :label => "Sponsors",  :action => '/app/Sponsor',
          :icon => "/public/images/tabs/112-group.png" },
      { :label => "More",   :action => '/app/More', 
          :icon => "/public/images/tabs/09-chat2.png" }
    ]
    @@tabbar = nil
    
    super
    
    @default_menu = {
      "Home" => :home,
      "Refresh" => :refresh
    }

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    # SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
  end
end
