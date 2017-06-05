structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_get_type" : unit -> GObjectType.FFI.val_;
    val reset_ = _import "g_converter_reset" : GioConverterClass.FFI.notnull GioConverterClass.FFI.p -> unit;
    type 'a class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun reset self = (GioConverterClass.FFI.withPtr ---> I) reset_ self
  end
