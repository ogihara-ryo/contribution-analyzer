class GitHub::ActivityEvent
  class << self
    def sync
      call_github_events_api.each do |e|
        next if Event.exists?(id: e['id'])

        next if %w[PushEvent CreateEvent DeleteEvent].include? e['type']

        Event.create(
          id: e['id'],
          type: e['type'],
          actor: e['actor']['login'],
          repo_name: e['repo']['name'],
          timestamp: e['created_at']
        )
      end
    end

    def call_github_events_api
      repo_names.flat_map do |repo_name|
        3.times.flat_map do |page|
          call_github_api("/repos/#{ENV['CONTRIBUTION_ANALYZER_ORG_NAME']}/#{repo_name}/events?per_page=100&page=#{page}")
        end
      end
    end

    def repo_names
      call_github_api("/orgs/#{ENV['CONTRIBUTION_ANALYZER_ORG_NAME']}/repos?per_page=100").map { |repo| repo['name'] }
    end

    def call_github_api(path)
      uri = URI.parse("https://api.github.com#{path}")
      request = Net::HTTP::Get.new(uri)
      request.basic_auth('', ENV['CONTRIBUTION_ANALYZER_GITHUB_PERSONAL_ACCESS_TOKEN'])
      req_options = { use_ssl: uri.scheme == 'https' }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end
  end
end
