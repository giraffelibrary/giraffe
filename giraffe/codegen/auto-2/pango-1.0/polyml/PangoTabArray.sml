structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type record_t = PangoTabArrayRecord.t
    where type tabalign_t = PangoTabAlign.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_tab_array_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libpango "pango_tab_array_new") (FFI.PolyML.Int32.VAL &&> FFI.PolyML.Bool.VAL --> PangoTabArrayRecord.PolyML.PTR)
      val copy_ = call (load_sym libpango "pango_tab_array_copy") (PangoTabArrayRecord.PolyML.PTR --> PangoTabArrayRecord.PolyML.PTR)
      val getPositionsInPixels_ = call (load_sym libpango "pango_tab_array_get_positions_in_pixels") (PangoTabArrayRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getSize_ = call (load_sym libpango "pango_tab_array_get_size") (PangoTabArrayRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getTab_ =
        call (load_sym libpango "pango_tab_array_get_tab")
          (
            PangoTabArrayRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> PangoTabAlign.PolyML.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val resize_ = call (load_sym libpango "pango_tab_array_resize") (PangoTabArrayRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setTab_ =
        call (load_sym libpango "pango_tab_array_set_tab")
          (
            PangoTabArrayRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> PangoTabAlign.PolyML.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
    end
    type record_t = PangoTabArrayRecord.t
    type tabalign_t = PangoTabAlign.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new initialSize positionsInPixels = (FFI.Int32.withVal &&&> FFI.Bool.withVal ---> PangoTabArrayRecord.C.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.C.withPtr ---> FFI.Bool.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.C.withPtr ---> FFI.Int32.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> PangoTabAlign.C.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> PangoTabAlign.C.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & 0
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) resize_ (self & newSize)
    fun setTab self tabIndex alignment location =
      (
        PangoTabArrayRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> PangoTabAlign.C.withVal
         &&&> FFI.Int32.withVal
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
