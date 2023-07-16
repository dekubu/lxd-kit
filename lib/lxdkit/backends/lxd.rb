require 'English'
require 'strscan'
require 'mutex_m'

module LXDKit

  module Backend

    class Lxd < Abstract

      def upload!(local, remote, options = {})  
        debugger
        puts "upload: #{remote} #{local} #{options}"
      end

      def download!(remote, local=nil, options = {})
        debugger
        puts "download: #{remote} #{local} #{options}"
      end

      def execute_command(cmd)
        output.log_command_start(cmd.with_redaction)
        exit_status = nil
        cmd.started = true
        `lxc exec #{cmd.host} -- #{cmd.to_command}`
        exit_status = $?.exitstatus
        cmd.exit_status = $?.exitstatus
        output.log_command_exit(cmd)
      end

    end

  end

end
