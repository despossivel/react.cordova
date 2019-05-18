if "%~1" == "init" goto init
if "%~1" == "build" goto build
if "%~1" == "react" goto react
if "%~1" == "cordova" goto cordova

:react
cd react
call npm %2 %3 %4
cd..
goto end



:cordova

cd cordova
call cordova %2 %3 %4 %5
cd..

goto end



:init
RD /S /Q cordova
mkdir cordova
call cordova create cordova %3 %2

cd react
call npm i navigator-cordova-reactjs
call npm run build

cd ../cordova 
call cordova platform add android
call cordova platform add ios
call cordova platform ls

call cordova build

RD /S /Q www
mkdir www

cd ..
xcopy /s "react/build" "cordova/www"

cd cordova
call cordova build

cd..
goto end



:build
cd react
call npm run build

cd ../cordova
RD /S /Q www
mkdir www

cd..
xcopy /s "react/build" "cordova/www"

cd cordova
call cordova build

cd ..
goto end




:end
echo #####Created by Or Chuban#####
echo ######orchoban@gmail.com######