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

      def execute_command(cmd)
        output.log_command_start(cmd.with_redaction)
        exit_status = nil
        `lxc exec #{cmd.host} -- sh -c '#{_cmd.to_command}'`
        exit_status = 0

        cmd.exit_status = exit_status
        
        output.log_command_exit(cmd)        
        # Set exit_status and log the result upon completion
        if exit_status
          cmd.exit_status = exit_status
          output.log_command_exit(cmd)
        end
      end

    end

  end

end
