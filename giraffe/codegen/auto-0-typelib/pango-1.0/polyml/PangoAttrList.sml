structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type t = PangoAttrListRecord.t
    where type attribute_t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_attr_list_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_attr_list_new") (PolyMLFFI.cVoid --> PangoAttrListRecord.PolyML.cPtr)
      val change_ = call (load_sym libpango "pango_attr_list_change") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val copy_ = call (load_sym libpango "pango_attr_list_copy") (PangoAttrListRecord.PolyML.cPtr --> PangoAttrListRecord.PolyML.cPtr)
      val insert_ = call (load_sym libpango "pango_attr_list_insert") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val insertBefore_ = call (load_sym libpango "pango_attr_list_insert_before") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val splice_ =
        call (load_sym libpango "pango_attr_list_splice")
          (
            PangoAttrListRecord.PolyML.cPtr
             &&> PangoAttrListRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type t = PangoAttrListRecord.t
    type attribute_t = PangoAttributeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoAttrListRecord.FFI.fromPtr true) new_ ()
    fun change self attr = (PangoAttrListRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withPtr ---> I) change_ (self & attr)
    fun copy self = (PangoAttrListRecord.FFI.withPtr ---> PangoAttrListRecord.FFI.fromPtr true) copy_ self
    fun insert self attr = (PangoAttrListRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withPtr ---> I) insert_ (self & attr)
    fun insertBefore self attr = (PangoAttrListRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withPtr ---> I) insertBefore_ (self & attr)
    fun splice self other pos len =
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
