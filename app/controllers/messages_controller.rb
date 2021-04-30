class MessagesController < ApplicationController
require 'rubygems'
require 'twilio-ruby'

  def alert
    @account_sid = Rails.application.secrets.twilio_account_sid
    @auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @listing = Listing.find params[:listing_id]

    @message = @client.messages.create(
      body: params[:message],
      from: '+14088370527',
      to:'+61' +@listing.phone.to_s
    )
  end

  def offer
    @account_sid = Rails.application.secrets.twilio_account_sid
    @auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @listing = Listing.find params[:listing_id]

    @message = @client.messages.create(
      body: params[:message],
      from: '+14088370527',
      to:'+61' +@listing.phone.to_s
    )
  end
end
