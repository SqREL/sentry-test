require 'jsonclient'
class SentryClient
  TOKEN = "c466ff11bc4c4ac3a8bde7e7b0b41f6e4ab4c43cbbb94bc9b51b0b247dd7e14f"

  def initialize(project_token)
    @project_token = project_token
  end

  def item_by_counter(counter)
    with_error_handling(301) do
      client.get("/api/1/item_by_counter/#{counter}")
    end
  end

  def item_by_id(id)
    with_error_handling(200) do
      client.get("/api/0/issues/#{id}/")
    end
  end

  def update_issue(id, fields)
    with_error_handling(200) do
      client.patch(
        "/api/1/item/#{id}",
        fields.to_json
      )
    end
  end

  def with_error_handling(success_codes)
    response = yield

    return response.body if Array(success_codes).include?(response.status_code)
    fail "Unexpected response: #{response.status_code}: #{response.content}"
  end

  private

  def client
    @client ||= JSONClient.new(
      base_url: 'https://sentry.io',
      default_header: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{TOKEN}"
      }
    )
  end
end
