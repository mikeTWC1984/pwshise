## Extract or copy powershell binaries here

Download it manually from Powershell's github or use the script below

```
pwshurl="https://github.com/PowerShell/PowerShell/releases/download/v7.0.0-preview.3/powershell-7.0.0-preview.3-linux-x64.tar.gz"
curl -L -o pwsh.tmp $pwshurl 
tar xf pwsh.tmp -C ~/pwshise/powershell
rm pwsh.tmp
```

Then uncomment this line on init.vim:

```
call coc#config("powershell.powerShellExePath", ($HOME . "/pwshise/powershell/pwsh"))
```
