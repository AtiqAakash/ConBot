Write-Output ""
Write-Output ""
Write-Output "                                                 RA - Configurator Robot"
Write-Output ""
Write-Output "                                                    Developed By Atiq"
Write-Output ""
Write-Output "                                             Now sit back and have a coffee!"
Write-Output ""
Write-Output ""

Start-Sleep -Seconds 5

Import-Module BitsTransfer

Write-Output "Starting Downloads"

Write-Output "Downloading MAVProxy (1/10)"
Start-BitsTransfer -Source "https://firmware.ardupilot.org/Tools/MAVProxy/MAVProxySetup-latest.exe" -Destination "$PSScriptRoot\MAVProxySetup-latest.exe"

Write-Output "Downloading QGroundControl (2/10)"
Start-BitsTransfer -Source "https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl-installer.exe" -Destination "$PSScriptRoot\QGroundControl-installer.exe"


Write-Output "Downloading Cygwin x64 (3/10)"
Start-BitsTransfer -Source "https://cygwin.com/setup-x86_64.exe" -Destination "$PSScriptRoot\setup-x86_64.exe"

Write-Output "Downloading ARM GCC Compiler 10-2020-Q4-Major (4/10)"
Start-BitsTransfer -Source "https://firmware.ardupilot.org/Tools/STM32-tools/gcc-arm-none-eabi-10-2020-q4-major-win32.exe" -Destination "$PSScriptRoot\gcc-arm-none-eabi-10-2020-q4-major-win32.exe"

Write-Output "Installing Cygwin x64 (5/10)"
Start-Process -wait -FilePath $PSScriptRoot\setup-x86_64.exe -ArgumentList "--root=C:\cygwin64 --no-startmenu --local-package-dir=$env:USERPROFILE\Downloads --site=http://cygwin.mirror.constant.com --packages autoconf,automake,ccache,cygwin32-gcc-g++,gcc-g++=7.4.0-1,libgcc1=7.4.0.1,gcc-core=7.4.0-1,git,libtool,make,gawk,libexpat-devel,libxml2-devel,python39,python39-future,python39-lxml,python39-pip,python39-pip3,libxslt-devel,python39-devel,procps-ng,zip,gdb,ddd,xterm --quiet-mode"
Start-Process -wait -FilePath "C:\cygwin64\bin\bash" -ArgumentList "--login -i -c 'ln -sf /usr/bin/python3.9 /usr/bin/python'"
Start-Process -wait -FilePath "C:\cygwin64\bin\bash" -ArgumentList "--login -i -c 'ln -sf /usr/bin/pip3.9 /usr/bin/pip'"

Write-Output "Downloading extra Python packages (6/10)"
Start-Process -wait -FilePath "C:\cygwin64\bin\bash" -ArgumentList "--login -i -c 'pip3 install empy pyserial pymavlink intelhex dronecan pexpect'"

Write-Output "Installing ARM GCC Compiler 10-2020-Q4-Major (7/10)"
& $PSScriptRoot\gcc-arm-none-eabi-10-2020-q4-major-win32.exe /S /P /R

Write-Output "Installing MAVProxy (8/10)"
& $PSScriptRoot\MAVProxySetup-latest.exe /SILENT | Out-Null

Write-Output "Installing QGroundControl (9/10)"
& $PSScriptRoot\QGroundControl-installer.exe 


Write-Output "Configuring Ardupilot (10/10)"


# Cygwin commands to run
$cygwinCommands = @(
    "git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git"
 )

# Construct the command string to run in Cygwin
$cygwinCommand = $cygwinCommands -join '; '

# Start Cygwin and run the commands
$cygwinPath = "C:\cygwin64\bin\bash"  # Update this path based on your Cygwin installation
Start-Process -FilePath $cygwinPath -ArgumentList "--login -i -c `"$cygwinCommand`"" -NoNewWindow


Write-Host "Congratulations! Primary Configuration is done! Hit Enter to Exit."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")