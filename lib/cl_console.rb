require "active_support/core_ext"
require "json"
require 'open-uri'

class CLConsole
  attr_accessor :options
    
  def initialize(url, opts={})
    @cl_url = if url.start_with? "http"
                url
              else
                parts = url.split('/')
                "http://localhost:5984/#{parts[0]}/_fti/_design/#{parts[1]}/#{parts[2]}"
              end

    @options = opts
  end
  
  # do the actual query
  def q(query, opts={})
    opts = options.merge(opts).merge({:q => query})
    url = "#{@cl_url}?#{opts.to_param}"
    puts "query: " << url if opts[:debug]
    res = JSON.parse(open(url).string)
    puts ">> q: #{res["q"]} (#{res["search_duration"]}ms / #{res["fetch_duration"]}ms)"
    res
  end
  
  # do the query, and only give me the rows
  def qr(query, opts={})
    q(query,opts)["rows"]
  end

  # do the query, ensure that cl fetches the documents and return only the documents
  def qd(query, opts={})
    qr(query,{:include_docs => true}.merge(opts)).inject([]) do |acc,row|
      acc << row["doc"]
    end
  end
  
  # fetch index infos
  def info
    puts "query: " << @cl_url if options[:debug]
    JSON.parse(open("#{@cl_url}").string)
  end
  
  # helper to escape searchterms properly for lucene search queries
  def escape(str)
    lucene_chars = %w{+ - & | ! ( ) { } [ ] ^ " ~ * ? : \\}.collect {|e| Regexp.escape(e)}
    str.gsub!(/(#{lucene_chars.join("|")})/, '\\\\\1')
  end
  
  # display help message
  def help
    puts <<-HELP_MSG
------------------------------------------------------------------------------
 CL-Console Help
==============================================================================
Example usage:

# initialize with "database/designdocument/index" (ddoc without _design)
cl = CLConsole.new("db/ddoc/index")

# or initialize with a full url
cl = CLConsole.new("http://localhost:5984/db/_fti/_design/ddoc/index")    

# You can also pass a hash with options to be passed to couchdb-lucene, like
# limit, sorting, debug, ... see the couchdb-lucene documentation for details.

# query

cl.q "simple"   # issue a simple query and give the raw result from c-l
cl.qr "simple"  # same query but only the result rows
cl.qd "simple"  # and this time only return the documents

# do a more sophisticated request and let cl-console escape special chars
cl.qd "title:(couchdb OR lucene) AND body:(awesome AND \#{cl.escape(':-)')})"

# meta

cl.info         # get index infos
cl.help         # this info
------------------------------------------------------------------------------
    HELP_MSG
  end
end