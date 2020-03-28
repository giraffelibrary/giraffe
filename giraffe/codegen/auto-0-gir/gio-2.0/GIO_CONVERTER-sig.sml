signature GIO_CONVERTER =
  sig
    type 'a class
    type converter_result_t
    type converter_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val convert :
      'a class
       -> GUInt8CArrayN.t
           * GUInt8CArrayN.t
           * converter_flags_t
       -> converter_result_t
           * LargeInt.int
           * LargeInt.int
    val reset : 'a class -> unit
  end
