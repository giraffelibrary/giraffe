structure GioIcon :>
  GIO_ICON
    where type 'a class_t = 'a GioIconClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_icon_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newForString_ = call (load_sym libgio "g_icon_new_for_string") (Utf8.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val equal_ = call (load_sym libgio "g_icon_equal") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val toString_ = call (load_sym libgio "g_icon_to_string") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
    end
    type 'a class_t = 'a GioIconClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForString str = (Utf8.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GioIconClass.C.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & icon2)
    fun toString self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
