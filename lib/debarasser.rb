module Debarasser
  require 'octokit'

  PRODUCT = 'debarasser'
  VERSION = '0.1.0'

  class << self
    def get_forks(client)
      client.repos.select { |x| x['fork'] }.map {|y| y['full_name']}
    end

    def delete_forks(client, forks)
      forks.each_with_index do |x, i|
        puts "#{i+1}. deleting #{x}"
        client.delete_repo x
        sleep 0.4
      end

      puts "done"
    end

    def cli
      puts "#{PRODUCT} #{VERSION}"

      c = Octokit::Client.new(netrc: true)
      c.auto_paginate = true

      puts "getting forks ..."
      f = get_forks(c)

      if f.count == 0
        puts "no forks 😎"
        exit
      end

      puts "forks found: #{f.count}"
      f.each_with_index { |f, i| puts "#{i+1}. #{f}"}

      print "proceed with delete? (y/n) "
      user_input = STDIN.gets.chomp
      exit unless user_input.downcase == 'y'
      delete_forks c, f      
    end
  end
end
