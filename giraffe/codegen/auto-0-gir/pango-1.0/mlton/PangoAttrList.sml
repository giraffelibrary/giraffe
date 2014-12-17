structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type record_t = PangoAttrListRecord.t
    where type attributerecord_t = PangoAttributeRecord.t =
  struct
    val getType_ = _import "pango_attr_list_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "pango_attr_list_new" : unit -> PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p;
    val change_ = fn x1 & x2 => (_import "pango_attr_list_change" : PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p * PangoAttributeRecord.C.notnull PangoAttributeRecord.C.p -> unit;) (x1, x2)
    val copy_ = _import "pango_attr_list_copy" : PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p -> PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p;
    val insert_ = fn x1 & x2 => (_import "pango_attr_list_insert" : PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p * PangoAttributeRecord.C.notnull PangoAttributeRecord.C.p -> unit;) (x1, x2)
    val insertBefore_ = fn x1 & x2 => (_import "pango_attr_list_insert_before" : PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p * PangoAttributeRecord.C.notnull PangoAttributeRecord.C.p -> unit;) (x1, x2)
    val splice_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_attr_list_splice" :
              PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p
               * PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type record_t = PangoAttrListRecord.t
    type attributerecord_t = PangoAttributeRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> PangoAttrListRecord.C.fromPtr true) new_ ()
    fun change self attr = (PangoAttrListRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> I) change_ (self & attr)
    fun copy self = (PangoAttrListRecord.C.withPtr ---> PangoAttrListRecord.C.fromPtr true) copy_ self
    fun insert self attr = (PangoAttrListRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> I) insert_ (self & attr)
    fun insertBefore self attr = (PangoAttrListRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> I) insertBefore_ (self & attr)
    fun splice self other pos len =
      (
        PangoAttrListRecord.C.withPtr
         &&&> PangoAttrListRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
