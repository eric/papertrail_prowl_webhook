require 'yajl'
require 'active_support'
require 'prowly'

module PapertrailProwlWebhook
  class App < Sinatra::Base
    get '/' do
      "200\n"
    end

    post '/submit' do
      payload = HashWithIndifferentAccess.new(Yajl::Parser.parse(params[:payload]))

      payload[:events].each do |event|
        Prowly.notify do |n|
          n.apikey      = ENV['PROWL_API_KEY']
          n.priority    = Prowly::Notification::Priority::NORMAL
          n.application = 'Papertrail'
          n.event       = event[:hostname]
          n.description = event[:message]
          n.url         = "#{payload[:saved_search][:html_search_url]}?center_on_id=#{event[:id]}"
        end
      end

      'ok'
    end
  end
end