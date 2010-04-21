# CouchDB-Lucene Console

    $ gem install cl-console
    $ irb -rrubygems -rcl_console
    >> cl = CLConsole.new("database/ddoc/index")
    => #<CLConsole:0x101df9d08 [...]>
    >> cl.q "test"
    => {"total_rows"=>1, "etag"=>"11a69b3141bc67e8", "search_duration"=>0, "q"=>"default:test", "rows"=>[{"id"=>"f3fba9f61520e0ef2a245772a900074c", "score"=>1}], "fetch_duration"=>0, "limit"=>25, "skip"=>0}
    >> cl.help
