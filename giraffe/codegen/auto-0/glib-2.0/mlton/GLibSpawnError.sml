structure GLibSpawnError :>
  sig
    include
      G_LIB_SPAWN_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      FORK
    | READ
    | CHDIR
    | ACCES
    | PERM
    | 2BIG
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FORK => f 0
          | READ => f 1
          | CHDIR => f 2
          | ACCES => f 3
          | PERM => f 4
          | 2BIG => f 5
          | NOEXEC => f 6
          | NAMETOOLONG => f 7
          | NOENT => f 8
          | NOMEM => f 9
          | NOTDIR => f 10
          | LOOP => f 11
          | TXTBUSY => f 12
          | IO => f 13
          | NFILE => f 14
          | MFILE => f 15
          | INVAL => f 16
          | ISDIR => f 17
          | LIBBAD => f 18
          | FAILED => f 19
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FORK
          | 1 => READ
          | 2 => CHDIR
          | 3 => ACCES
          | 4 => PERM
          | 5 => 2BIG
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
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-exec-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibSpawnError = GLibSpawnError.Error
