@echo off
cd ptm
echo Building PTM executable using PyInstaller...
python -m pip install pyinstaller
python -m PyInstaller --onefile --noconsole main.py --name PTM_Assistant
echo Executable built in ptm\\dist
pause
