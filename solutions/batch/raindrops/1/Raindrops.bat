@ECHO off
SETLOCAL EnableDelayedExpansion

SET "input=%~1"
SET "result="

REM Your code goes here

REM BEGIN MAIN PROCESS
:MAIN
	REM Check Div by 3
	CALL :REMAINDER %input% 3
	IF !_remainder! EQU 0 SET "result=%result%Pling" 

	REM Check Div by 5
	CALL :REMAINDER %input% 5
	IF !_remainder! EQU 0 SET "result=%result%Plang"

	REM Check Div by 7
	CALL :REMAINDER %input% 7
	IF !_remainder! EQU 0 SET "result=%result%Plong"

	REM Check if no common factors (3, 5, 7)
	IF "x!result!" EQU "x" SET "result=%input%"

	REM Echo Result
	ECHO !result!

	GOTO END
REM END MAIN PROCESS

REM REMAINDER PROCESS
:REMAINDER
	SETLOCAL
	SET /A "_remainderTemp = %1 %% %2"
	ENDLOCAL & SET "_remainder=%_remainderTemp%"

:END REM END ENTIRE SCRIPT
