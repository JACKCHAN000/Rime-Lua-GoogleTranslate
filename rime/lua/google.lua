local json = require("json")
local http = require("socket.http")
local url = require("socket.url")

local function make_url(input)
   local sl = "en"
   local tl = "zh_TW"
   return 'http://translate.googleapis.com/translate_a/single?client=gtx&sl='.. sl ..'&tl='.. tl ..'&dt=t&q='.. url.escape(input)
end

local function translator(input, seg)
   --get the first Candidate
   local reply = http.request(make_url(input))
   local data = json.decode(reply)

   for i, v in ipairs(data) do
      -- get the output string
      local output = v[1][1]
      local c = Candidate("translate", seg.start, seg._end, output, "翻譯")
      -- add to Candidate
      yield(c)
   end
end

return translator
