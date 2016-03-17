structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type t = PangoTabArrayRecord.t
    where type tab_align_t = PangoTabAlign.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_tab_array_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_tab_array_new") (FFI.Int.PolyML.cVal &&> FFI.Bool.PolyML.cVal --> PangoTabArrayRecord.PolyML.cPtr)
      val copy_ = call (load_sym libpango "pango_tab_array_copy") (PangoTabArrayRecord.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cPtr)
      val getPositionsInPixels_ = call (load_sym libpango "pango_tab_array_get_positions_in_pixels") (PangoTabArrayRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSize_ = call (load_sym libpango "pango_tab_array_get_size") (PangoTabArrayRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getTab_ =
        call (load_sym libpango "pango_tab_array_get_tab")
          (
            PangoTabArrayRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> PangoTabAlign.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val resize_ = call (load_sym libpango "pango_tab_array_resize") (PangoTabArrayRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTab_ =
        call (load_sym libpango "pango_tab_array_set_tab")
          (
            PangoTabArrayRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> PangoTabAlign.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type t = PangoTabArrayRecord.t
    type tab_align_t = PangoTabAlign.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new initialSize positionsInPixels = (FFI.Int.C.withVal &&&> FFI.Bool.C.withVal ---> PangoTabArrayRecord.C.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.C.withPtr ---> FFI.Bool.C.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> PangoTabAlign.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> PangoTabAlign.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & FFI.Int.null
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) resize_ (self & newSize)
    fun setTab self tabIndex alignment location =
      (
        PangoTabArrayRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> PangoTabAlign.C.withVal
         &&&> FFI.Int.C.withVal
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
