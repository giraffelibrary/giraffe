structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type t = PangoTabArrayRecord.t
    where type tab_align_t = PangoTabAlign.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_tab_array_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_tab_array_new") (GInt32.PolyML.cVal &&> GBool.PolyML.cVal --> PangoTabArrayRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "pango_tab_array_copy") (PangoTabArrayRecord.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cPtr)
      val getPositionsInPixels_ = call (getSymbol "pango_tab_array_get_positions_in_pixels") (PangoTabArrayRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSize_ = call (getSymbol "pango_tab_array_get_size") (PangoTabArrayRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getTab_ =
        call (getSymbol "pango_tab_array_get_tab")
          (
            PangoTabArrayRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> PangoTabAlign.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val resize_ = call (getSymbol "pango_tab_array_resize") (PangoTabArrayRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setTab_ =
        call (getSymbol "pango_tab_array_set_tab")
          (
            PangoTabArrayRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> PangoTabAlign.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type t = PangoTabArrayRecord.t
    type tab_align_t = PangoTabAlign.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new initialSize positionsInPixels = (GInt32.FFI.withVal &&&> GBool.FFI.withVal ---> PangoTabArrayRecord.FFI.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.FFI.withPtr ---> PangoTabArrayRecord.FFI.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.FFI.withPtr ---> GBool.FFI.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> PangoTabAlign.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> PangoTabAlign.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & GInt32.null
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) resize_ (self & newSize)
    fun setTab self tabIndex alignment location =
      (
        PangoTabArrayRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> PangoTabAlign.FFI.withVal
         &&&> GInt32.FFI.withVal
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
