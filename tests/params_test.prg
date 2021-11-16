/*
    System.......:
    Program......: params_class.prg
    Description..: Commum methods class test.
    Author.......: Sergio Lima
    Updated at...: Nov, 2021

	How to compile:
	hbmk2 params_test.hbp

	How to run:
	./params_test

*/

#include "hbclass.ch"
#include "../../hbexpect/lib/hbexpect.ch"

FUNCTION Main()

	begin hbexpect
		LOCAL oParams

		describe "params Class"
			oParams := Params():New()

			describe "When instantiate"
				describe "Params():New() --> oParams"
					describe "oParams"
						context "Class Name" expect(oParams) TO_BE_CLASS_NAME("PARAMS")
						context "result" expect(oParams) NOT_TO_BE_NIL
						context "type" expect(oParams) TO_BE_OBJECT_TYPE
					enddescribe
				enddescribe
			enddescribe

			oParams := oParams:Destroy()

		enddescribe

	endhbexpect

RETURN NIL