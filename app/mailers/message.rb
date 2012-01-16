class Message < ActionMailer::Base
  default from: " CMOJ <from@example.com>"

  def contact_mail sender, message
    mail(:to => ['carlos@mumo.mx','jose@mumo.mx'], :subject => "Test Contact") do |format|
      format.html { render 'public_message', :locals => {:sender => sender, :message => message} }
    end
  end

  def suggestion sender, message
    mail(:to => ['carlos@mumo.mx','jose@mumo.mx'], :subject => "Test Suggestion") do |format|
      format.html { render 'suggestions', :locals => {:sender => sender, :message => message} }
    end
  end
end
