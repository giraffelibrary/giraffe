structure GdkRgba :>
  GDK_RGBA
    where type t = GdkRgbaRecord.t =
  struct
    val getType_ = _import "gdk_rgba_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gdk_rgba_copy" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "gdk_rgba_equal" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hash_ = _import "gdk_rgba_hash" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GUInt.FFI.val_;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_rgba_parse" :
              GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gdk_rgba_to_string" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val red'Offset_ = _import "giraffe_gdk_rgba_red_offset" : unit -> GSize.FFI.val_;
    val green'Offset_ = _import "giraffe_gdk_rgba_green_offset" : unit -> GSize.FFI.val_;
    val blue'Offset_ = _import "giraffe_gdk_rgba_blue_offset" : unit -> GSize.FFI.val_;
    val alpha'Offset_ = _import "giraffe_gdk_rgba_alpha_offset" : unit -> GSize.FFI.val_;
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
