structure PangoItem :>
  PANGO_ITEM
    where type t = PangoItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_item_new") (cVoid --> PangoItemRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "pango_item_copy") (PangoItemRecord.PolyML.cPtr --> PangoItemRecord.PolyML.cOptPtr)
      val split_ =
        call (getSymbol "pango_item_split")
          (
            PangoItemRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PangoItemRecord.PolyML.cPtr
          )
    end
    type t = PangoItemRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoItemRecord.FFI.fromPtr true) new_ ()
    fun copy self = (PangoItemRecord.FFI.withPtr ---> PangoItemRecord.FFI.fromOptPtr true) copy_ self
    fun split self (splitIndex, splitOffset) =
      (
        PangoItemRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> PangoItemRecord.FFI.fromPtr true
      )
        split_
        (
          self
           & splitIndex
           & splitOffset
        )
  end
