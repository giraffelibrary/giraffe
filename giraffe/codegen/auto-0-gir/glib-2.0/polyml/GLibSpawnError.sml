structure GLibSpawnError :>
  G_LIB_SPAWN_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      FORK
    | READ
    | CHDIR
    | ACCES
    | PERM
    | TOO_BIG
    | NOEXEC
    | NAMETOOLONG
    | NOENT
    | NOMEM
    | NOTDIR
    | LOOP
    | TXTBUSY
    | IO
    | NFILE
    | MFILE
    | INVAL
    | ISDIR
    | LIBBAD
    | FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = FORK
        val toInt =
          fn
            FORK => 0
          | READ => 1
          | CHDIR => 2
          | ACCES => 3
          | PERM => 4
          | TOO_BIG => 5
          | NOEXEC => 6
          | NAMETOOLONG => 7
          | NOENT => 8
          | NOMEM => 9
          | NOTDIR => 10
          | LOOP => 11
          | TXTBUSY => 12
          | IO => 13
          | NFILE => 14
          | MFILE => 15
          | INVAL => 16
          | ISDIR => 17
          | LIBBAD => 18
          | FAILED => 19
        exception Value of GInt.t
        val fromInt =
          fn
            0 => FORK
          | 1 => READ
          | 2 => CHDIR
          | 3 => ACCES
          | 4 => PERM
          | 5 => TOO_BIG
          | 6 => NOEXEC
          | 7 => NAMETOOLONG
          | 8 => NOENT
          | 9 => NOMEM
          | 10 => NOTDIR
          | 11 => LOOP
          | 12 => TXTBUSY
          | 13 => IO
          | 14 => NFILE
          | 15 => MFILE
          | 16 => INVAL
          | 17 => ISDIR
          | 18 => LIBBAD
          | 19 => FAILED
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-exec-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibSpawnError = GLibSpawnError.Error
