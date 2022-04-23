local json = require("json")
local http = require("socket.http")
local url = require("socket.url")


local function translator(input, seg, env)
   local string = env.focus_text
   local reply, code = http.request('http://suggestqueries.google.com/complete/search?output=firefox&q=' .. string)
   local data = json.decode(reply)
   output_list = data[2]
   output_length = #output_list
   for i = 1, output_length do
      -- add to Candidate
      local c = Candidate("translate", seg.start, seg._end, output_list[i], "建議")
      yield(c)
   end
end

return translator