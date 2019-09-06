
# Use F4 to toggle integrated console

# select the line below with mouse (or shft+V) and hit F8
Write-Host "List of console colors" -ForegroundColor Green 
# this will get you to the terminal window
# to type something in terminal press i, and then Esc to exit insert mode.

# then go back to this window (by left click or with ctrl+w+w), then hit F5 (also try ctrl-F5)

Write-Host ("------------------------`n"*5)

[enum]::GetValues([System.ConsoleColor]).ForEach({

  Write-Host $_ -ForegroundColor $_

})

$a = 2000

$b = "hello"

# to exit nvim hit ctrl-F12 (or type :qa!) 
