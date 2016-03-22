structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_get_type" : unit -> GObjectType.C.val_;
    val reset_ = _import "g_converter_reset" : GioConverterClass.C.notnull GioConverterClass.C.p -> unit;
    type 'a class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun reset self = (GioConverterClass.C.withPtr ---> I) reset_ self
  end
