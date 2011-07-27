require 'net/ssh'
require 'net/sftp'
require 'benchmark'

time = Benchmark.measure do
  Net::SSH.start('host', 'username', :password => 'password') do |ssh|
    ssh.sftp.connect do |sftp|
      sftp.dir.entries(".").each do |entry|
        puts entry.name
      end
      # sftp.dir.foreach("/home/semperos") do |entry|
      #   puts entry.name
      # end
      puts "Complete"
    end
  end
end

puts time
