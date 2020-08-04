structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type t = PangoAttrListRecord.t
    where type attribute_t = PangoAttributeRecord.t =
  struct
    val getType_ = _import "pango_attr_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_attr_list_new" : unit -> PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p;
    val change_ = fn x1 & x2 => (_import "pango_attr_list_change" : PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p * PangoAttributeRecord.FFI.non_opt PangoAttributeRecord.FFI.p -> unit;) (x1, x2)
    val copy_ = _import "pango_attr_list_copy" : PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p -> PangoAttrListRecord.FFI.opt PangoAttrListRecord.FFI.p;
    val insert_ = fn x1 & x2 => (_import "pango_attr_list_insert" : PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p * PangoAttributeRecord.FFI.non_opt PangoAttributeRecord.FFI.p -> unit;) (x1, x2)
    val insertBefore_ = fn x1 & x2 => (_import "pango_attr_list_insert_before" : PangoAttrListRecord.FFI.non_opt PangoAttrListRecord.FFI.p * PangoAttributeRecord.FFI.non_opt PangoAttributeRecord.FFI.p -> unit;) (x1, x2)
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
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = PangoAttrListRecord.t
    type attribute_t = PangoAttributeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoAttrListRecord.FFI.fromPtr true) new_ ()
    fun change self attr = (PangoAttrListRecord.FFI.withPtr false &&&> PangoAttributeRecord.FFI.withPtr true ---> I) change_ (self & attr)
    fun copy self = (PangoAttrListRecord.FFI.withPtr false ---> PangoAttrListRecord.FFI.fromOptPtr true) copy_ self
    fun insert self attr = (PangoAttrListRecord.FFI.withPtr false &&&> PangoAttributeRecord.FFI.withPtr true ---> I) insert_ (self & attr)
    fun insertBefore self attr = (PangoAttrListRecord.FFI.withPtr false &&&> PangoAttributeRecord.FFI.withPtr true ---> I) insertBefore_ (self & attr)
    fun splice
      self
      (
        other,
        pos,
        len
      ) =
      (
        PangoAttrListRecord.FFI.withPtr false
         &&&> PangoAttrListRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
