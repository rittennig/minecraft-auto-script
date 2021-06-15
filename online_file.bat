@echo off
:: Current Version 21.6 Made on 15 June 2021
:: All the Download Links

::Server Jars 1.17 for mojang and 1.16.5 for paper
set mojang_jar=https://launcher.mojang.com/v1/objects/0a269b5f2c5b93b1712d0f5dc43b6182b9ab254e/server.jar
set paper_jar=https://papermc.io/api/v1/paper/1.16.5/latest/download

::The Eula.txt I mean i could just make it lol maybe next version lol
set eula_txt=https://raw.githubusercontent.com/rittennig/minecraft-auto-script/main/eula.txt

::The Server properties I mean i need to download making it would be fricking hard lol
set ser_props_legit=https://raw.githubusercontent.com/rittennig/minecraft-auto-script/main/server_legit.properties
set ser_props_crack=https://raw.githubusercontent.com/rittennig/minecraft-auto-script/main/server_cracked.properties

:begin
    cls
    echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    echo @ Minecraft All-in-one Script @
    echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    echo ...............................
    echo (1) Full Auto (No-crack, Papermc)
    echo (2) Full Auto (Cracked, Papermc)
    echo (3) Full Auto (No-crack, Vanilla)
    echo (4) Full Auto (Cracked, Vanilla)
    echo (5) Install NGROK (For Non-Public IP)
    echo (6) Exit the Program (Don't Use the X on top or CTRL + C)

    set /p selection=Select a Number and press Enter:
    if %selection%==1 goto full_auto_legit
    if %selection%==2 goto full_auto_cracked
    if %selection%==3 goto full_auto_legit_v
    if %selection%==4 goto full_auto_cracked_v
    if %selection%==5 goto ngrok_installer
    if %selection%==6 goto exitchoda
    if %selection%==7 goto egg


:full_auto_cracked
    cls
    echo Downloading The Minecraft Server Files Version 1.16.5 from papermc's servers.
    curl -o server.jar %paper_jar%
    curl -o eula.txt %eula_txt%
    curl -o server.properties %ser_props_crack%
    goto make_start_file

:full_auto_legit
    cls
    echo Downloading The Minecraft Server Files Version 1.16.5 from papermc's servers.
    curl -o server.jar %paper_jar%
    curl -o eula.txt %eula_txt%
    curl -o server.properties %ser_props_legit%
    goto make_start_file

:full_auto_legit_v
    cls
    echo Downloading The Minecraft Server Files Version 1.16.5 from Mojang!
    curl -o server.jar %mojang_jar%
    curl -o eula.txt %eula_txt%
    curl -o server.properties %ser_props_legit%
    goto make_start_file

:full_auto_cracked_v
    cls
    echo Downloading The Minecraft Server Files Version 1.16.5 from Mojang!
    curl -o server.jar %mojang_jar%
    curl -o eula.txt %eula_txt%
    curl -o server.properties %ser_props_crack%
    goto make_start_file

:make_start_file
    cls
    echo Making Start Files
    echo Please select how much detoteded wam u shound want in your server.
    echo (Dedicated Ram in your server)
    set /p ram_amount=Select in GB not MB like 1 for 1GB and 2 for 2GB:
    echo java -Xmx%ram_amount%G -Xms512M -jar server.jar nogui>start.bat
    cls
    echo Start file made Successfully!!
    echo Do you want to setup Ngrok Now? If you Select Yes, Server Will not start Right now.
    echo You Have to manually Start server with start.bat.
    set /p goto_ngrok_bool=(Y = Yes, N = NO):
    if %goto_ngrok_bool%==Y goto ngrok_installer
    if %goto_ngrok_bool%==N start start.bat 
    goto exit-1

:ngrok_installer
    cls
    echo Starting Installation of NGROK... Please Wait.
    curl -o ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip
    tar -xf ngrok.zip
    goto ngrok_setup_1

:ngrok_setup_1
    cls
    echo Do you have a NGROK Account?
    set /p ng_acc=(Y / N):
    if %ng_acc%== Y goto ngrok_auth_install
    if %ng_acc%== N goto ngrok_auth_mkacc

:ngrok_auth_mkacc
    cls
    echo Launching ngrok Website, after making account please Continue.
    start https://dashboard.ngrok.com/signup
    pause
    goto ngrok_auth_install

:ngrok_auth_install
    cls
    echo Get the Authtoken, launching authtoken Website.
    start https://dashboard.ngrok.com/get-started/your-authtoken
    set /p authtok=Copy the authtoken and paste it here:
    ngrok.exe authtoken %authtok%
    echo Making a .bat file to start Ngrok after setup.
    echo ngrok.exe tcp 25565 -region=ap>ngrok_start.bat
    timeout 3
    goto begin

:egg
    cls
    echo Hmm, You don't like following the rules.
    echo Anyways, you found an egg lol

    echo         .-"-.
    echo       .'     '.
    echo      /         \
    echo     :           ;
    echo     ^|           ^|
    echo     :           :
    echo      \         /
    echo       `.     .'
    echo         `~~~`
    pause
    goto begin

:exitchoda
    echo Exiting Program Thx For Using lol.
    del /f tmp.bat
    timeout 5
    exit