structure PangoAttrList :>
  PANGO_ATTR_LIST
    where type t = PangoAttrListRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_attr_list_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_attr_list_new") (cVoid --> PangoAttrListRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "pango_attr_list_copy") (PangoAttrListRecord.PolyML.cPtr --> PangoAttrListRecord.PolyML.cOptPtr)
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
