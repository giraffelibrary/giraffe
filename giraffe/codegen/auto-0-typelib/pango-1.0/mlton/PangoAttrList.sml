structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type t = PangoAttrListRecord.t =
  struct
    val getType_ = _import "pango_attr_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_attr_list_new" : unit -> PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p;
    val copy_ = _import "pango_attr_list_copy" : PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p -> PangoAttrListRecord.FFI.opt PangoAttrListRecord.FFI.p;
    val splice_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_attr_list_splice" :
              PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p
               * PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = PangoAttrListRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoAttrListRecord.FFI.fromPtr true) new_ ()
    fun copy self = (PangoAttrListRecord.FFI.withPtr ---> PangoAttrListRecord.FFI.fromOptPtr true) copy_ self
    fun splice
      self
      (
        other,
        pos,
        len
      ) =
      (
        PangoAttrListRecord.FFI.withPtr
         &&&> PangoAttrListRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        splice_
        (
          self
           & other
           & pos
           & len
        )
  end
