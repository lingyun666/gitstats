::行注释，不会将它作为命令处理
::1.@echo off:执行批处理的命令的意思
@echo off

::2.1根据当前日期获取，年月日串
set yyyy=%date:~,4%
set mm=%date:~5,2%
set day=%date:~8,2% 
set "YYYYmmdd=%yyyy%%mm%%day%"

::2.2根据当前时间获取，时分秒串
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2% 
set "hhmiss=%hh%%mi%%ss%"

::2.3设置文件夹名变量:dirName(格式:年月日Hms时分秒串,例子:20200918 HH164800)
set "dirName=%YYYYmmdd%Hms%hhmiss%"
echo %dirName%

::3.1打开gitstats程序所在目录
cd C:\Program File\tool\GitStat\gitstats
::3.2通过python执行gitstats.py,生成报告. 引用变量"%dirName%",自动生成文件夹名
python gitstats  C:\Users\hws\workspace\as\project2\gitlab\1\app report/"%dirName%"
::4.打开生成报告的文件夹
start explorer "C:\Program File\tool\GitStat\gitstats\report"
echo "success! any key to exit progress"
pause
exit