require 'slack-ruby-client'

TOKEN_ID = ENV['TOKEN_ID']

def lambda_handler(event:, context:)
  Slack.configure do |config|
    config.token = TOKEN_ID
  end

  client = Slack::Web::Client.new
  begin
    client.chat_command(
      channel: '#times_katsumata',
      command: '/jobcan_touch',
      text: 'by AWS Lmabda for Ruby via IFTTT',
      as_user: true
    )
  rescue => e
    {statusCode: 422, body: JSON.generate({class: e.class, message: e.message})}
  end

  {statusCode: 200, body: JSON.generate({message: 'ok'})}
end
