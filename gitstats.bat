::行注释，不会将它作为命令处理
::1.@echo off:不显示正在运行的命令
@echo off

::2.1根据当前日期获取，年月日串(用于设置以时间为名字的文件名)
set yyyy=%date:~,4%
set mm=%date:~5,2%
set day=%date:~8,2% 
set "YYYYmmdd=%yyyy%%mm%%day%"
::2.2根据当前时间获取，时分秒串
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2% 
set "hhmiss=%hh%%mi%%ss%"

::3.1待测应用文件夹路径
set "appPath=C:\Users\hws\workspace\as\project2\gitlab\1\app"
::3.2gitstats源码所在文件夹路径
set "gitstatsPath=C:\Program File\tool\GitStat\gitstats"
::3.3存储报告的路径及文件名:reportPathAndFileName(格式:年月日Hms时分秒串,例子:20200918 HH164800)
set "reportPathAndFileName=C:\Program File\data\gitstats\report\%YYYYmmdd%Hms%hhmiss%"

::4.1打开gitstats程序所在目录
cd %gitstatsPath%
::4.2通过python执行gitstats.py,生成报告.
python gitstats  %appPath% "%reportPathAndFileName%"

::5.1打开生成报告的文件夹
start explorer "%reportPathAndFileName%"
::5.2使用默认浏览器打开html文件
for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set SoftWareRoot=%%a %%b)
start "" % SoftWareRoot % "%reportPathAndFileName%\authors.html"

echo "success! any key to exit progress"
pause
exit
