local json = require("json")
local http = require("socket.http")
local url = require("socket.url")

local function make_url(input)
   local sl = "zh_TW"
   local tl = "en"
   return 'http://translate.googleapis.com/translate_a/single?client=gtx&sl='.. sl ..'&tl='.. tl ..'&dt=t&q='.. url.escape(input)
end



local function translator(input, seg, env)
   Path = "C:\\Users\\JACK\\AppData\\Roaming\\Rime\\lua\\clip.txt"
   File = io.open(Path, "r")
   for line in io.lines(Path) do
      S = line
   end
   local reply = http.request(make_url(S))
   local data = json.decode(reply)

   for i, v in ipairs(data) do
      -- get the output string
      local output = v[1][1]
      local c = Candidate("translate", seg.start, seg._end, output, "翻譯")
      -- add to Candidate
      yield(c)
   end
   File = io.open(Path, "w")
   io.write("")
   io.close(File)
end

return translator
