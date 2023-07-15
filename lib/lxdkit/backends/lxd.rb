require 'English'
require 'strscan'
require 'mutex_m'

module LXDKit

  module Backend

    class lxd < Abstract

      def upload!(local, remote, options = {})
        puts "upload: #{remote} #{local} #{options}"
      end

      def download!(remote, local=nil, options = {})
        puts "download: #{remote} #{local} #{options}"
      end

      def execute(*args)
        puts "execute: #{args}"
      end

    end

end
