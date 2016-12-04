module CyberDojo
  module WaitMixIn

    def until_or_false
      end_time = Time.now + @timeout
      last_error = nil

      until Time.now > end_time
        begin
          result = yield
          return result
        rescue *@ignored => last_error
          # swallowed
        end

        sleep @interval
      end

      false
    end

  end
end