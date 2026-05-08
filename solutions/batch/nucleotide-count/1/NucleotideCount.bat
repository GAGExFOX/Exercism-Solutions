@ECHO off
SETLOCAL EnableDelayedExpansion

SET "nucleotide=%~1"
SET "nucleotide[A]=0"
SET "nucleotide[C]=0"
SET "nucleotide[G]=0"
SET "nucleotide[T]=0"

REM Your code goes here

REM Check if String actually exists
IF "[%nucleotide%]" EQU "[]" GOTO _PRINT_VALS

REM Variable for Indexing input string
SET "index = 0"

REM Main Loop for string iteration
:MAIN_LOOP
	REM Grab letter of current index from string
	SET "CurrentLetter=!nucleotide:~%index%, 1!"

	REM Increment A if found
	IF "!CurrentLetter!" EQU "A" (
		SET /A "nucleotide[A] += 1"
		SET /A "index += 1"
		GOTO MAIN_LOOP

	REM Increment C if found
	) ELSE IF "!CurrentLetter!" EQU "C" (
		SET /A "nucleotide[C] += 1"
		SET /A "index += 1"
		GOTO MAIN_LOOP

	REM Increment G if found
	) ELSE IF "!CurrentLetter!" EQU "G" (
		SET /A "nucleotide[G] += 1"
		SET /A "index += 1"
		GOTO MAIN_LOOP

	REM Increment T if found
	) ELSE IF "!CurrentLetter!" EQU "T" (
		SET /A "nucleotide[T] += 1"
		SET /A "index += 1"
		GOTO MAIN_LOOP

	REM Execute end process if end of string
	) ELSE IF "!CurrentLetter!" EQU "" (
		GOTO _PRINT_VALS

	REM Execute error process if invalid string
	) ELSE (
		GOTO ERROR
	)

REM String is proper and print val count
:_PRINT_VALS
	ECHO !nucleotide[A]!,!nucleotide[C]!,!nucleotide[G]!,!nucleotide[T]!
	GOTO END

REM String is improper, return error
:ERROR
	ECHO Invalid nucleotide in strand
	GOTO END

:END

