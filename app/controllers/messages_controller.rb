class MessagesController < ApplicationController

  #Used Twilio API for MessagesController
  #function t send message
  def alert
      @account_sid = Rails.application.secrets.twilio_account_sid #SID received from Twilio, key hidden in bash profile and Heroku
      @auth_token = Rails.application.secrets.twilio_auth_token #Auth_token received from TWIlio, key hidden in bash profile and Heroku
      @client = Twilio::REST::Client.new(@account_sid, @auth_token) #set client with TWilio
      @listing = Listing.find params[:listing_id]
      @phone = @listing.phone.last(4)

      if @phone != "7961"
        "Invalid Number"
      else
        @message = @client.messages.create(
          body: params[:message], #message typed by user
          from: '+14088370527', #Got this number from Twilio
          to:'+61' +@listing.phone.to_s #message deliver to listing phone number
        )
      end
  end

  #function to send offer message
  def offer
    @account_sid = Rails.application.secrets.twilio_account_sid
    @auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @listing = Listing.find params[:listing_id]
    @phone = @listing.phone.last(4)

    if @phone != "7961"
      "Invalid Number"

    else
      @message = @client.messages.create(
        body: params[:message],
        from: '+14088370527',
        to:'+61' +@listing.phone.to_s)
    end
  end
end
