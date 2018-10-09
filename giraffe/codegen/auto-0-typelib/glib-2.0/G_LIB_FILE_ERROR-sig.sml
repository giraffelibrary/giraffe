signature G_LIB_FILE_ERROR =
  sig
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
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
