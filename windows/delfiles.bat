#
#删除文件夹下面的某一类文件
#

@echo off
rem 处理中...

for /f "delims=" %%i in ('dir /b "*.o"') do del %%i

rem 处理完毕.
pause