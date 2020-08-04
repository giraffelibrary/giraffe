structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type t = PangoTabArrayRecord.t
    where type tab_align_t = PangoTabAlign.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_tab_array_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_tab_array_new") (GInt.PolyML.cVal &&> GBool.PolyML.cVal --> PangoTabArrayRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "pango_tab_array_copy") (PangoTabArrayRecord.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cPtr)
      val getPositionsInPixels_ = call (getSymbol "pango_tab_array_get_positions_in_pixels") (PangoTabArrayRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSize_ = call (getSymbol "pango_tab_array_get_size") (PangoTabArrayRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTab_ =
        call (getSymbol "pango_tab_array_get_tab")
          (
            PangoTabArrayRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> PangoTabAlign.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val resize_ = call (getSymbol "pango_tab_array_resize") (PangoTabArrayRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setTab_ =
        call (getSymbol "pango_tab_array_set_tab")
          (
            PangoTabArrayRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> PangoTabAlign.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
    type t = PangoTabArrayRecord.t
    type tab_align_t = PangoTabAlign.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (initialSize, positionsInPixels) = (GInt.FFI.withVal &&&> GBool.FFI.withVal ---> PangoTabArrayRecord.FFI.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.FFI.withPtr false ---> PangoTabArrayRecord.FFI.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> PangoTabAlign.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> PangoTabAlign.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & GInt.null
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) resize_ (self & newSize)
    fun setTab
      self
      (
        tabIndex,
        alignment,
        location
      ) =
      (
        PangoTabArrayRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> PangoTabAlign.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setTab_
        (
          self
           & tabIndex
           & alignment
           & location
        )
  end
