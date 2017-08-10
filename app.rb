class App
  def call(env)
    name = env['QUERY_STRING'].to_s.empty? ? 'John Doe' : env['QUERY_STRING']

    headers = { 'Content-Type' => 'text/plain' }
    body = [ "Hey #{name}, It's App here." ]

    [200, headers, body]
  end
end
