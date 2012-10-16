structure GLibFileError :>
  sig
    include
      G_LIB_FILE_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            EXIST => f 0
          | ISDIR => f 1
          | ACCES => f 2
          | NAMETOOLONG => f 3
          | NOENT => f 4
          | NOTDIR => f 5
          | NXIO => f 6
          | NODEV => f 7
          | ROFS => f 8
          | TXTBSY => f 9
          | FAULT => f 10
          | LOOP => f 11
          | NOSPC => f 12
          | NOMEM => f 13
          | MFILE => f 14
          | NFILE => f 15
          | BADF => f 16
          | INVAL => f 17
          | PIPE => f 18
          | AGAIN => f 19
          | INTR => f 20
          | IO => f 21
          | PERM => f 22
          | NOSYS => f 23
          | FAILED => f 24
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
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
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-file-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibFileError = GLibFileError.Error
