cd MOD-BIG-FILES
for /r %%A in (*.big) do (
	..\bigtool_x86_64_win.exe -x %%A ..\EXTRACTED-MOD\
)

pause