require 'English'
require 'strscan'
require 'mutex_m'

module LXDKit

  module Backend

    class Lxd < Abstract

      def upload!(local, remote, options = {})
        puts "upload: #{remote} #{local} #{options}"
      end

      def download!(remote, local=nil, options = {})
        puts "download: #{remote} #{local} #{options}"
      end

      
      def def execute_command(_cmd)
        puts "execute: #{_cmd}"
      end

    end

  end

end
