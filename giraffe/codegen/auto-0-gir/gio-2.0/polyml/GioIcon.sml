structure GioIcon :>
  GIO_ICON
    where type 'a class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val deserialize_ = call (getSymbol "g_icon_deserialize") (GLibVariantRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val newForString_ = call (getSymbol "g_icon_new_for_string") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioIconClass.PolyML.cPtr)
      val equal_ = call (getSymbol "g_icon_equal") (GioIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val serialize_ = call (getSymbol "g_icon_serialize") (GioIconClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val toString_ = call (getSymbol "g_icon_to_string") (GioIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deserialize value = (GLibVariantRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) deserialize_ value
    fun newForString str = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.FFI.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GioIconClass.FFI.withPtr &&&> GioIconClass.FFI.withOptPtr ---> GBool.FFI.fromVal) equal_ (self & icon2)
    fun serialize self = (GioIconClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) serialize_ self
    fun toString self = (GioIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
