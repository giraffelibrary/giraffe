signature GIO_I_O_MODULE_SCOPE =
  sig
    type t
    val block :
      t
       -> string
       -> unit
  end
