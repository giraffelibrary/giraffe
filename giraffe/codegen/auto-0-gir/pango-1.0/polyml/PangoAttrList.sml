structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type record_t = PangoAttrListRecord.t
    where type attribute_record_t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_attr_list_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_attr_list_new") (FFI.PolyML.cVoid --> PangoAttrListRecord.PolyML.cPtr)
      val change_ = call (load_sym libpango "pango_attr_list_change") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copy_ = call (load_sym libpango "pango_attr_list_copy") (PangoAttrListRecord.PolyML.cPtr --> PangoAttrListRecord.PolyML.cPtr)
      val insert_ = call (load_sym libpango "pango_attr_list_insert") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val insertBefore_ = call (load_sym libpango "pango_attr_list_insert_before") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val splice_ =
        call (load_sym libpango "pango_attr_list_splice")
          (
            PangoAttrListRecord.PolyML.cPtr
             &&> PangoAttrListRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type record_t = PangoAttrListRecord.t
    type attribute_record_t = PangoAttributeRecord.t
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
