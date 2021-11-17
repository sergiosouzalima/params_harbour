/*
    System.......:
    Program......: params_class.prg
    Description..: Commum methods class
    Author.......: Sergio Lima
    Updated at...: Nov, 2021
*/


#include "hbclass.ch"
#include "custom_commands_v1.1.0.ch"


CREATE CLASS Params

    EXPORTED:
        METHOD  New() CONSTRUCTOR
        METHOD  Destroy()
        METHOD  RecordSet( ahRecordSet ) SETGET
        METHOD  Found()
        METHOD  NotFound()
        METHOD  RecordSetLength()
        METHOD  FoundMany()
        METHOD  TableEmpty()

    HIDDEN:
        DATA    ahRecordSet     AS ARRAY    INIT { => }

ENDCLASS

METHOD New() CLASS Params
RETURN Self

METHOD Destroy() CLASS Params
    Self := NIL
RETURN Self

METHOD RecordSet(ahRecordSet) CLASS Params
    ::ahRecordSet := ahRecordSet IF hb_IsArray(ahRecordSet)
RETURN ::ahRecordSet

METHOD TableEmpty() CLASS Params
RETURN ::RecordSetLength() == 0

METHOD RecordSetLength() CLASS Params
RETURN Len(::RecordSet)

METHOD Found() CLASS Params
RETURN ::RecordSetLength() > 0

METHOD FoundMany() CLASS Params
RETURN ::RecordSetLength() > 1

METHOD NotFound() CLASS Params
RETURN !::Found()