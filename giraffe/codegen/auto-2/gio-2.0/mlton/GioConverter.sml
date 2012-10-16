structure GioConverter :>
  GIO_CONVERTER
    where type 'a class_t = 'a GioConverterClass.t =
  struct
    val getType_ = _import "g_converter_get_type" : unit -> GObjectType.C.val_;
    val reset_ = _import "g_converter_reset" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioConverterClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun reset self = (GObjectObjectClass.C.withPtr ---> I) reset_ self
  end
