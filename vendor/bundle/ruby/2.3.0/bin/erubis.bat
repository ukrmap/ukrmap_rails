@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Ruby2.3.3\bin\ruby.exe" "C:/Users/povodok/work/ukrmap_rails/vendor/bundle/ruby/2.3.0/bin/erubis" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Ruby2.3.3\bin\ruby.exe" "%~dpn0" %*
