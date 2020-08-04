structure GdkRectangle :>
  GDK_RECTANGLE
    where type t = GdkRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_rectangle_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val equal_ = call (getSymbol "gdk_rectangle_equal") (GdkRectangleRecord.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val intersect_ =
        call (getSymbol "gdk_rectangle_intersect")
          (
            GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val union_ =
        call (getSymbol "gdk_rectangle_union")
          (
            GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
    end
    type t = GdkRectangleRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun equal self rect2 = (GdkRectangleRecord.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & rect2)
    fun intersect self src2 =
      let
        val dest & retVal =
          (
            GdkRectangleRecord.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            intersect_
            (
              self
               & src2
               & ()
            )
      in
        if retVal then SOME dest else NONE
      end
    fun union self src2 =
      let
        val dest & () =
          (
            GdkRectangleRecord.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            union_
            (
              self
               & src2
               & ()
            )
      in
        dest
      end
  end
