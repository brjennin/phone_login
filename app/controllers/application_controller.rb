class ApplicationController < ActionController::API
end

=begin
enforce a client token is sent on every request
have verification tokens expire
allow a verification token to only be used once
validate phone numbers are in the correct format
have verification tokens with a one time use only
accept phone numbers of different formats
have auth and refresh tokens
have an endpoint/microservice to see if an auth token is expired
have an endpoint/microservice to verify auth tokens
support other countries
=end
