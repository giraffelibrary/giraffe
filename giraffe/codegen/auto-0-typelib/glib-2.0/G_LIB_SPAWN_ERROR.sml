signature G_LIB_SPAWN_ERROR =
  sig
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
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
