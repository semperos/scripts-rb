#!/usr/bin/env ruby

# Kramdown parser (disable auto-id's by default)
def use_kramdown(args)
  require 'kramdown'
  args.each do |a|
    input_fname = File.expand_path(a)
    output_fname = File.join(File.dirname(a), File.basename(a, ".md") + ".html")
    md_src = IO.read(input_fname)
    File.open(output_fname, "w") do |f|
      opts = {
        :auto_ids => false,
        :smart_quotes => ["apos", "apos", "quot", "quot"],
      }
      f.write(Kramdown::Document.new(md_src, opts).to_html)
    end
  end
end

# Redcarpet parser
def use_redcarpet(args)
  require 'redcarpet'
  args.each do |a|
    input_fname = File.expand_path(a)
    output_fname = File.join(File.dirname(a), File.basename(a, ".md") + ".html")
    md_src = IO.read(input_fname)
    File.open(output_fname, "w") do |f|
      f.write(Redcarpet.new(md_src).to_html)
    end
  end
end

# Accept one optional command-line arg
if ARGV[0].start_with? "-"
  parser_opt = ARGV.shift
  case parser_opt
    when "-k" then use_kramdown(ARGV)
    when "-r" then use_redcarpet(ARGV)
  else
    raise "Use either -k, -r or no command-line options"
  end
else
  use_kramdown(ARGV)
end
