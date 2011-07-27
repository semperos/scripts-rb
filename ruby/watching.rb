require 'watchr'

watch('posts/.*\.md') do |md|
  system("mdown -k #{md[0]}")
  system("echo Compiled file #{md[0]}")
end
