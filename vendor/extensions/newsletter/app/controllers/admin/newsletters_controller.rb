class Admin::NewslettersController < Admin::ResourceController

  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    csv_string = FasterCSV.generate do |csv|
      
      @newsletters = Newsletter.all
      
      @filename = 'newsletter.csv'
      csv << ["email"]
         
      @newsletters.each do |news|
        csv << [news.email]
      end
      
    end

    send_data(csv_string,
      :type => 'text/csv; charset=utf-8; header=present; disposition=attachment',
      :filename => @filename,
      :disposition => 'attachment')

  end


end
