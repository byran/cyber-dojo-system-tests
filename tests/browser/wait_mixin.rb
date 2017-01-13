module CyberDojo

  module WaitMixIn

    class WaitFailure < Exception

      def location
        last_before_assertion = ""
        self.backtrace.reverse_each do |s|
          break if s =~ /in until/
          last_before_assertion = s
        end
        last_before_assertion.sub(/:in .*$/, "")
      end

    end


    def until_or_false
      end_time = Time.now + @timeout
      last_error = nil
      until Time.now > end_time
        begin
          result = yield
          return result if result
        rescue *@ignored => last_error
          # swallowed
        end
        sleep @interval
      end
      false
    end

    def until_with_message(message)
      end_time = Time.now + @timeout
      last_error = nil
      until Time.now > end_time
        begin
          result = yield
          return result if result
        rescue *@ignored => last_error
          # swallowed
        end
        sleep @interval
      end

      message << " (#{last_error.message})" if last_error

      fail WaitFailure, message
    end

  end

end