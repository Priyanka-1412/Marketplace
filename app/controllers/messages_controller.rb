class MessagesController < ApplicationController

require 'rubygems'
require 'twilio-ruby'



  def alert
    @account_sid = 'ACde6975edb99ba7419124d1cb340a09ad'
    @auth_token = '9ccdde72b929716dbec0ed961bbeaf79'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @listing = Listing.find params[:listing_id]

    @message = @client.messages.create(
      body: 'Hi there, Is this item still available?!',
      from: '+14088370527',
      to:@listing.phone
    )
  end
end
