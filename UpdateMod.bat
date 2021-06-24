rmdir /s /q "EXTRACTED-MOD"
mkdir "EXTRACTED-MOD"

cd MOD-BIG-FILES
for /r %%A in (*.big) do (
	..\bigtool_x86_64_win.exe -x %%A ..\EXTRACTED-MOD\
)
cd ..

break>ObjectFileList.txt
cd EXTRACTED-MOD\data\ini\object
dir *.ini /b /s >> ../../../../ObjectFileList.txt
dir *.inc /b /s >> ../../../../ObjectFileList.txt
cd ../../../../

break>MapIniList.txt
cd EXTRACTED-MOD\maps
dir *.ini /b /s >> ../../MapIniList.txt
cd ../../

lua53.exe ExecuteModDefinitionScript.lua

cd EXTRACTED-MOD
..\bigtool_x86_64_win.exe -c ..\UPDATED-MOD\__UpdatedMod.big data art maps

xcopy xcopy /y /h /v /i "..\UPDATED-MOD\__UpdatedMod.big" "D:\Spiele\BFME\Aufstieg des Hexenkönigs\"

pause