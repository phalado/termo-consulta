url = Rails.env.development? || Rails.env.test? ? 'http://elasticsearch:9200' : ENV["ELASTICSEARCH_URL"]
Searchkick.client = Elasticsearch::Client.new({ url: url, logs: true })
