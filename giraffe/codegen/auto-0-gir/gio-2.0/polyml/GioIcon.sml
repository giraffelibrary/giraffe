structure GioIcon :>
  GIO_ICON
    where type 'a class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_icon_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newForString_ = call (load_sym libgio "g_icon_new_for_string") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioIconClass.PolyML.cPtr)
      val equal_ = call (load_sym libgio "g_icon_equal") (GioIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val toString_ = call (load_sym libgio "g_icon_to_string") (GioIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForString str = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.FFI.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GioIconClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & icon2)
    fun toString self = (GioIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
