structure GioIcon :>
  GIO_ICON
    where type 'a class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_icon_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newForString_ = call (load_sym libgio "g_icon_new_for_string") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioIconClass.PolyML.cPtr)
      val equal_ = call (load_sym libgio "g_icon_equal") (GioIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val toString_ = call (load_sym libgio "g_icon_to_string") (GioIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForString str = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.C.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GioIconClass.C.withPtr &&&> GioIconClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & icon2)
    fun toString self = (GioIconClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
