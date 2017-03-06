Set WshShell = WScript.CreateObject("WScript.Shell")
Return = WshShell.Run("iexplore.exe www.google.com", 1)