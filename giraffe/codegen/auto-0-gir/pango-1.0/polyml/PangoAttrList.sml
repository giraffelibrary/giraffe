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
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
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
