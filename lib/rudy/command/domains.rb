

module Rudy
  class Domains
    include Rudy::Huxtable
    include Rudy::AWS
    
    def list
      @@sdb.list_domains || []
    end
    
    def get(n=nil)
      n = name(Rudy::DOMAIN)
      n &&= n.to_s
      doms = list.select { |domain| domain == n }
      doms = nil if doms.empty?
      doms
    end
    
    def exists?(n=nil)
      !get(n).nil?
    end
    
    def name(n=nil)
      n || Rudy::DOMAIN
    end
    
    def create(n=nil)
      n = name(n)
      @@sdb.create_domain(n)
    end
      
  end
end