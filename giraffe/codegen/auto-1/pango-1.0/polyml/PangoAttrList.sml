structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type record_t = PangoAttrListRecord.t
    where type attributerecord_t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_attr_list_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libpango "pango_attr_list_new") (FFI.PolyML.VOID --> PangoAttrListRecord.PolyML.PTR)
      val change_ = call (load_sym libpango "pango_attr_list_change") (PangoAttrListRecord.PolyML.PTR &&> PangoAttributeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val copy_ = call (load_sym libpango "pango_attr_list_copy") (PangoAttrListRecord.PolyML.PTR --> PangoAttrListRecord.PolyML.PTR)
      val insert_ = call (load_sym libpango "pango_attr_list_insert") (PangoAttrListRecord.PolyML.PTR &&> PangoAttributeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val insertBefore_ = call (load_sym libpango "pango_attr_list_insert_before") (PangoAttrListRecord.PolyML.PTR &&> PangoAttributeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val splice_ =
        call (load_sym libpango "pango_attr_list_splice")
          (
            PangoAttrListRecord.PolyML.PTR
             &&> PangoAttrListRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
    end
    type record_t = PangoAttrListRecord.t
    type attributerecord_t = PangoAttributeRecord.t
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
