# Rime-Lua-GoogleTranslate
GoogleTranslate in Rime輸入法

Based On https://github.com/hchunhui/librime-cloud

中譯英:

![final_606b23cc785d7e003d750948_420746](https://user-images.githubusercontent.com/61930699/113588017-3419ce80-9662-11eb-8ce6-51e6443a32e8.gif)


英譯中:

![final_606b23148efa0600b740d680_363311](https://user-images.githubusercontent.com/61930699/113589246-b8b91c80-9663-11eb-8458-2312e69cfd92.gif)

How to install
1. Copy all files in ```weasel``` to the program folder of rime
2. Edit the path of c2e.lua and c2etrigger.lua to your path
3. Copy all files in ```rime``` to your user folder of rime
4. Add ```lua_processor@c2e_processor, lua_processor@e2c_processor, lua_translator@c2e_translator, lua_translator@e2c_translator``` 
   to your schema file
4. Enjoy


How to use

Trigger:```
中譯英:Control+t
英譯中:Control+e```
 1. Type the input
 2. Activate the trigger
 3. Return a translate on the candidate bar
