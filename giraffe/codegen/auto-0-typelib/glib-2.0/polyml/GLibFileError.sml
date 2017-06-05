structure GLibFileError :>
  G_LIB_FILE_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      EXIST
    | ISDIR
    | ACCES
    | NAMETOOLONG
    | NOENT
    | NOTDIR
    | NXIO
    | NODEV
    | ROFS
    | TXTBSY
    | FAULT
    | LOOP
    | NOSPC
    | NOMEM
    | MFILE
    | NFILE
    | BADF
    | INVAL
    | PIPE
    | AGAIN
    | INTR
    | IO
    | PERM
    | NOSYS
    | FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = EXIST
        val toInt =
          fn
            EXIST => 0
          | ISDIR => 1
          | ACCES => 2
          | NAMETOOLONG => 3
          | NOENT => 4
          | NOTDIR => 5
          | NXIO => 6
          | NODEV => 7
          | ROFS => 8
          | TXTBSY => 9
          | FAULT => 10
          | LOOP => 11
          | NOSPC => 12
          | NOMEM => 13
          | MFILE => 14
          | NFILE => 15
          | BADF => 16
          | INVAL => 17
          | PIPE => 18
          | AGAIN => 19
          | INTR => 20
          | IO => 21
          | PERM => 22
          | NOSYS => 23
          | FAILED => 24
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => EXIST
          | 1 => ISDIR
          | 2 => ACCES
          | 3 => NAMETOOLONG
          | 4 => NOENT
          | 5 => NOTDIR
          | 6 => NXIO
          | 7 => NODEV
          | 8 => ROFS
          | 9 => TXTBSY
          | 10 => FAULT
          | 11 => LOOP
          | 12 => NOSPC
          | 13 => NOMEM
          | 14 => MFILE
          | 15 => NFILE
          | 16 => BADF
          | 17 => INVAL
          | 18 => PIPE
          | 19 => AGAIN
          | 20 => INTR
          | 21 => IO
          | 22 => PERM
          | 23 => NOSYS
          | 24 => FAILED
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-file-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibFileError = GLibFileError.Error
