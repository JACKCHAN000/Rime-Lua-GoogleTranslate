local json = require("json")
local http = require("simplehttp")

local function escape(s)
   return (string.gsub(s, "([^A-Za-z0-9_])", function(c)
       return string.format("%%%02x", string.byte(c))
   end))
end

local function make_url(input)
   local sl = "en"
   local tl = "zh_TW"
   return 'http://translate.googleapis.com/translate_a/single?client=gtx&sl='.. sl ..'&tl='.. tl ..'&dt=t&q='.. escape(input)
end

local function translator(input, seg)
   local context = input
   -- 'as space key
   local string = context:gsub("%'", " ")

   local reply = http.request(make_url(string))
   local data = json.decode(reply)

   for i, v in ipairs(data) do
      -- get the output string
      local output = v[1][1]
      local c = Candidate("translate", seg.start, seg._end, output, "翻譯")
      -- add to Candidate
      yield(c)
      yield(Candidate("translate", seg.start, seg._end, string, "原文"))
   end
end

return translator
