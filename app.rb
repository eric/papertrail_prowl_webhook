module PapertrailProwlWebhook
  class App < Sinatra::Base
    get '/' do
      "200\n"
    end

    post '/submit' do
      payload = HashWithIndifferentAccess.new(Yajl::Parser.parse(params[:payload]))

      payload[:events].each do |event|
        Prowly.notify do |n|
          n.apikey = ENV['PROWL_API_KEY']
          n.priority = Prowly::Notification::Priority::MODERATE
          n.event = event[:hostname]
          n.description = event[:message]
        end
      end

      'ok'
    end
  end
end