structure GdkColor :>
  GDK_COLOR
    where type record_t = GdkColorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_color_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libgdk "gdk_color_copy") (GdkColorRecord.PolyML.PTR --> GdkColorRecord.PolyML.PTR)
      val equal_ = call (load_sym libgdk "gdk_color_equal") (GdkColorRecord.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val hash_ = call (load_sym libgdk "gdk_color_hash") (GdkColorRecord.PolyML.PTR --> FFI.PolyML.Word32.VAL)
      val toString_ = call (load_sym libgdk "gdk_color_to_string") (GdkColorRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val parse_ = call (load_sym libgdk "gdk_color_parse") (FFI.PolyML.String.INPTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type record_t = GdkColorRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkColorRecord.C.withPtr ---> GdkColorRecord.C.fromPtr true) copy_ self
    fun equal self colorb = (GdkColorRecord.C.withPtr &&&> GdkColorRecord.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & colorb)
    fun hash self = (GdkColorRecord.C.withPtr ---> FFI.Word32.fromVal) hash_ self
    fun toString self = (GdkColorRecord.C.withPtr ---> FFI.String.fromPtr true) toString_ self
    fun parse spec =
      let
        val color & retVal = (FFI.String.withConstPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && FFI.Bool.fromVal) parse_ (spec & ())
      in
        if retVal then SOME color else NONE
      end
  end
