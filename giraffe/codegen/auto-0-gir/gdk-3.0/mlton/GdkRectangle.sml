structure GdkRectangle :>
  GDK_RECTANGLE
    where type t = GdkRectangleRecord.t =
  struct
    val getType_ = _import "gdk_rectangle_get_type" : unit -> GObjectType.FFI.val_;
    val equal_ = fn x1 & x2 => (_import "gdk_rectangle_equal" : GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val intersect_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_rectangle_intersect" :
              GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val union_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_rectangle_union" :
              GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GdkRectangleRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun equal self rect2 = (GdkRectangleRecord.FFI.withPtr &&&> GdkRectangleRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & rect2)
    fun intersect self src2 =
      let
        val dest & retVal =
          (
            GdkRectangleRecord.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withPtr
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
            GdkRectangleRecord.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withPtr
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
