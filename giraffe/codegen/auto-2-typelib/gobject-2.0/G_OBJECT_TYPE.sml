signature G_OBJECT_TYPE =
  sig
    eqtype t

    val isValueType : t -> bool
    val name : t -> string
    val fromName : string -> t option

    val boolean : unit -> t
    val int     : unit -> t
    val uint    : unit -> t
    val long    : unit -> t
    val ulong   : unit -> t
    val int64   : unit -> t
    val uint64  : unit -> t
    val float   : unit -> t
    val double  : unit -> t
    val char    : unit -> t
    val string  : unit -> t

    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
