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

      
      def execute_command(_cmd)
        "lxc exec #{_cmd.host} -- #{_cmd.to_command"
        puts "execute: #{_cmd} - #{_cmd.class}"
      end

    end

  end

end
