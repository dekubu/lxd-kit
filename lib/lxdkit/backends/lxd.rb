require 'English'
require 'strscan'
require 'mutex_m'

module LXDKit

  module Backend

    class Lxd < Abstract

      def upload!(local, remote, options = {})  
        debugger
        #`lxc file push /etc/hosts foo/etc/hosts`
        puts "upload: #{remote} #{local} #{options}"
      end

      def download!(remote, local=nil, options = {})
        debugger
        #`lxc file push /etc/hosts foo/etc/hosts`
        puts "download: #{remote} #{local} #{options}"
      end

      def execute_command(cmd)
        output.log_command_start(cmd.with_redaction)
        cmd.started = true
        puts `lxc exec #{cmd.host} -- #{cmd.to_command}`
        cmd.exit_status = exit_status
        output.log_command_exit(cmd)
      end

    end

  end

end
