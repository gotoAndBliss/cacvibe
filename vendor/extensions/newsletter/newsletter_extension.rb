# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class NewsletterExtension < Radiant::Extension
  version "1.0"
  description "Newsletter for Radiant CMS 0.9"
  url ""
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # See your config/routes.rb file in this extension to define custom routes
  
  def activate
    Page.send :include, NewsletterTags
    
    tab 'Content' do
      add_item "Newsletter", "/admin/newsletters", :after => "Pages"
    end
  end
end
