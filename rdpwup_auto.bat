@echo off
REM *****************************************
REM [NOMBRE]: rdpw_auto
REM [TIPO]: DOCUMENTACIÓN CÓDIGO
REM [LENGUAJE]: script bash
REM [VERSIÓN]: 0.2.1
REM [BUILD]: 105
REM [CREACIÓN]:20230526
REM [ACTUALIZACION]: 202030526
REM [AUTOR]: José Antonio García
REM *****************************************
REM [DESCRIPCIÓN]:

REM Script lanzar automáticamente rdpwaup para programar la tarea. 
REM    Registro en log de las ejecuciones

REM *****************************************
REM [HISTORICO]:

REM v0.3.0 - [ALPHA1] - build 108 - 20230526
REM    - Añadida el cambio de ruta del fichero. 
REM    - Añadido el reincio del servicio de escritorio remoto. 


REM v0.2.1 - [ALPHA1] - build 105 - 20230526
REM    - Corregido el versionado para github. 

REM v0.2.0 - [ALPHA1] - build 104 - 20230526
REM    - Añadida la funcionalidad del log. 
REM    - Añadida la documentación de código. 
REM    - 

REM v0.1.0 build 101 20230526
REM    - Creado el script para lanzar el programa en MODO AUTO. 

REM ****************************************

set MYTIME=%time:~0,5%
set MYSTIME=%time:~0,2%%time:~3,2%%time:~6,2%
SET MYDATE=%date:~6,4%%date:~3,2%%date:~0,2%
REM SET LOGFILE=rdpwup_auto_%MYDATE%_%MYTIME%.log
SET LOGFILE=./RdpWrapConfigTool/LOG/rdpwup_auto_%MYDATE%.log
SET RdpWAuto=./RdpWrapConfigTool/rdpwup.exe

echo *** Iniciando proceso... >>%LOGFILE%
echo %date% - %MYTIME% >>%LOGFILE%
rem call :logit >>%LOGFILE%
rem goto  

:logit 
if not exist "%RdpWAuto%" goto :error
echo Lanzando programa... >>%LOGFILE%
start %RdpWAuto% -AUTO
echo starting rdpwup.exe in auto mode >>%LOGFILE%
echo esperando que se ejecute el programa... >>%LOGFILE%
timeout /t 10 >nul
echo saliendo >>%LOGFILE%
echo Reiniciando servicio de control remoto >>%LOGFILE%
start ./RDPWInst.exe -r
goto :exit

:error
echo [-] Installer executable not found. >>%LOGFILE%
echo Please extract all files from the downloaded package or check your anti-virus. >>%LOGFILE%

:exit
echo *** ...finalizando proceso. >>%LOGFILE%
pause










