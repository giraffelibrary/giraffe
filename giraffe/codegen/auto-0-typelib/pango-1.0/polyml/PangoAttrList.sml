structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type t = PangoAttrListRecord.t
    where type attribute_t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_attr_list_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_attr_list_new") (cVoid --> PangoAttrListRecord.PolyML.cPtr)
      val change_ = call (getSymbol "pango_attr_list_change") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> cVoid)
      val copy_ = call (getSymbol "pango_attr_list_copy") (PangoAttrListRecord.PolyML.cPtr --> PangoAttrListRecord.PolyML.cOptPtr)
      val insert_ = call (getSymbol "pango_attr_list_insert") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> cVoid)
      val insertBefore_ = call (getSymbol "pango_attr_list_insert_before") (PangoAttrListRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> cVoid)
      val splice_ =
        call (getSymbol "pango_attr_list_splice")
          (
            PangoAttrListRecord.PolyML.cPtr
             &&> PangoAttrListRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type t = PangoAttrListRecord.t
    type attribute_t = PangoAttributeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoAttrListRecord.FFI.fromPtr true) new_ ()
    fun change self attr = (PangoAttrListRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withDupPtr ---> I) change_ (self & attr)
    fun copy self = (PangoAttrListRecord.FFI.withPtr ---> PangoAttrListRecord.FFI.fromOptPtr true) copy_ self
    fun insert self attr = (PangoAttrListRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withDupPtr ---> I) insert_ (self & attr)
    fun insertBefore self attr = (PangoAttrListRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withDupPtr ---> I) insertBefore_ (self & attr)
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
