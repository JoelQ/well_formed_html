require 'socket'

server = TCPServer.new 2000 # Server bind to port 2000
loop do
  client = server.accept
  request = client.gets

  requested_file = request.match(/(?<=\/)\S*(?=\s)/)[0]
  requested_file = 'index.html' if requested_file.empty?

  begin
    file = File.open requested_file, 'r'
    client.print "HTTP/1.1 200/OK\r\n\r\n"
    client.print file.read
  rescue Errno::ENOENT
    client.print "HTTP/1.1 404 Not Found\r\nContent-type:text/html\r\n\r\n"
    client.print "<h1>Not Found</h1><p>The requested URL /#{requested_file} was not found on this server</p>"
  end
  client.close
end
