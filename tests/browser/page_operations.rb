module CyberDojo

  class PageOperations

    protected
    attr_reader :pages

    public

    def initialize(page, assertions, pages)
      @page = page
      @assertions = assertions
      @pages = pages
    end

    def method_missing(sym, *args, &block)
      if @page.respond_to?(sym)
        @page.send(sym, *args, &block)
      elsif @assertions.respond_to?(sym)
        @assertions.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    def respond_to?(method, include_private = false)
      super || @page.respond_to?(method, include_private) || @assertions.respond_to?(method, include_private)
    end

  end

end
