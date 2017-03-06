[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[System.Windows.Forms.MessageBox]::Show("Your new password needs to have the following:

- Contain a minimum of 6 characters
- At least 1 UPPERCASE letter
- At least 1 lowercase letter
and 
- A number (0 through 9)
or
- A special character (!, $, #, %, @)" , "New Password Requirements" , 0)