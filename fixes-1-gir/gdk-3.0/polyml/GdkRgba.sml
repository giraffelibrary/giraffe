structure GdkRgba :>
  GDK_RGBA
    where type t = GdkRgbaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_rgba_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "gdk_rgba_copy") (GdkRgbaRecord.PolyML.cPtr --> GdkRgbaRecord.PolyML.cPtr)
      val equal_ = call (getSymbol "gdk_rgba_equal") (GdkRgbaRecord.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val hash_ = call (getSymbol "gdk_rgba_hash") (GdkRgbaRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val parse_ = call (getSymbol "gdk_rgba_parse") (GdkRgbaRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "gdk_rgba_to_string") (GdkRgbaRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val red'Offset_ = call (getSymbol "giraffe_gdk_rgba_red_offset") (cVoid --> GSize.PolyML.cVal)
      val green'Offset_ = call (getSymbol "giraffe_gdk_rgba_green_offset") (cVoid --> GSize.PolyML.cVal)
      val blue'Offset_ = call (getSymbol "giraffe_gdk_rgba_blue_offset") (cVoid --> GSize.PolyML.cVal)
      val alpha'Offset_ = call (getSymbol "giraffe_gdk_rgba_alpha_offset") (cVoid --> GSize.PolyML.cVal)
    end
    type t = GdkRgbaRecord.t
    structure RedField =
      Field(
        structure Container = GdkRgbaRecord
        structure FieldType = ValueFieldType(GDouble)
        val offset = (I ---> GSize.FFI.fromVal) red'Offset_
      )
    structure GreenField =
      Field(
        structure Container = GdkRgbaRecord
        structure FieldType = ValueFieldType(GDouble)
        val offset = (I ---> GSize.FFI.fromVal) green'Offset_
      )
    structure BlueField =
      Field(
        structure Container = GdkRgbaRecord
        structure FieldType = ValueFieldType(GDouble)
        val offset = (I ---> GSize.FFI.fromVal) blue'Offset_
      )
    structure AlphaField =
      Field(
        structure Container = GdkRgbaRecord
        structure FieldType = ValueFieldType(GDouble)
        val offset = (I ---> GSize.FFI.fromVal) alpha'Offset_
      )
    val red =
      {
        get = fn x => RedField.get x,
        set = fn x => RedField.set x
      }
    val green =
      {
        get = fn x => GreenField.get x,
        set = fn x => GreenField.set x
      }
    val blue =
      {
        get = fn x => BlueField.get x,
        set = fn x => BlueField.set x
      }
    val alpha =
      {
        get = fn x => AlphaField.get x,
        set = fn x => AlphaField.set x
      }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new {red, green, blue, alpha} =
      let
        fun init p = (
          RedField.C.set red p;
          GreenField.C.set green p;
          BlueField.C.set blue p;
          AlphaField.C.set alpha p
        )
        val r & () = (GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I) init ()
      in
        r
      end
    fun copy self = (GdkRgbaRecord.FFI.withPtr false ---> GdkRgbaRecord.FFI.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) hash_ self
    fun parse self spec = (GdkRgbaRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) parse_ (self & spec)
    fun toString self = (GdkRgbaRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
