@echo off
title GPS Configurator
cd /d %~dp0
echo GPS Configurator, Push GPS.CONF to Phone
echo Make sure your phone has debugging mode enabled!
echo (Settings, Applications, Developement, USB Debugging)
echo. 
adb root
echo.
echo ADB is now restarting in root mode, please wait until you hear
echo the USB sound or wait a couple seconds before pressing enter
echo.
pause
cls
adb wait-for-device
echo *** Mounting ***
adb -d shell su -c "mount -o remount rw /system"
echo.
echo *** Pushing gps.conf to phone ***
adb push gps.conf sdcard/gps.conf
echo.
echo *** Moving gps.conf from sdcard to /system/etc ***
adb -d shell su -c "busybox cp /sdcard/gps.conf /system/etc/gps.conf"
echo.
echo *** Setting Permissions to 644 (RW-R-R) ***
adb -d shell su -c "chmod 0644 system/etc/gps.conf"
echo.
echo Done... Press enter to exit this window.
pause
