# japanese_time
My not so alive project — When you handle japanese kanjis that represent time, minutes, seconds, days of the week
you may notice, that their reading changes depending on context. I used `natto` tool in order to convert kanjis to hiragana. 
And there I first met incorrect behaviour of `natto`.
Example: 
二十四日  -> `Nijū shi-nichi` which is not correct. 

二十四日  -> `Nijūyokka` which is correct. 

So my goal was to handle all incorrect interpretation cases.
There for I've built time converter, day of the week converter, hundreds and thousands converter and some more converters. 
Sadly I didn't suceed. Special translation cases were numerous and the count of kanjis to handle where numerous. 
My app became hard to develop so I decided to kill it with fire. 


