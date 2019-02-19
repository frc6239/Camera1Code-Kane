@echo off
title Deploy Python code to Raspberry Pi
@echo off

"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="D:\Users\kthsd2\Documents\Robotics\Vision\Camera1Code-Kane\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://pi:raspberry@10.62.39.24/ -hostkey=""ssh-ed25519 256 5uekAMwlA5RmYbVLia7f+1zEH+HafcBPa0ogExEDnHQ=""" ^
    "put "ShapeDetectionTest.py"" ^
    "put "findshapespipeline.py"" ^
    "put "ShapeDetector.py"" ^
	"exit"

putty -ssh pi@10.62.39.24 -pw raspberry -m puttyCommands.txt
	
set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)
echo Done

exit /b %WINSCP_RESULT%
