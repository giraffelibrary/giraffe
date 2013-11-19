structure GtkCellAreaContext :>
  GTK_CELL_AREA_CONTEXT
    where type 'a class_t = 'a GtkCellAreaContextClass.t
    where type 'a cellareaclass_t = 'a GtkCellAreaClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_area_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val allocate_ =
        call (load_sym libgtk "gtk_cell_area_context_allocate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getAllocation_ =
        call (load_sym libgtk "gtk_cell_area_context_get_allocation")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getArea_ = call (load_sym libgtk "gtk_cell_area_context_get_area") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPreferredHeight_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_height")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredHeightForWidth_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_height_for_width")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredWidth_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_width")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getPreferredWidthForHeight_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_width_for_height")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val pushPreferredHeight_ =
        call (load_sym libgtk "gtk_cell_area_context_push_preferred_height")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val pushPreferredWidth_ =
        call (load_sym libgtk "gtk_cell_area_context_push_preferred_width")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val reset_ = call (load_sym libgtk "gtk_cell_area_context_reset") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCellAreaContextClass.t
    type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun allocate self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        allocate_
        (
          self
           & width
           & height
        )
    fun getAllocation self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getAllocation_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
      end
    fun getArea self = (GObjectObjectClass.C.withPtr ---> GtkCellAreaClass.C.fromPtr false) getArea_ self
    fun getPreferredHeight self =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredHeightForWidth self width =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & width
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredWidth self =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getPreferredWidthForHeight self height =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & height
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun pushPreferredHeight self minimumHeight naturalHeight =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        pushPreferredHeight_
        (
          self
           & minimumHeight
           & naturalHeight
        )
    fun pushPreferredWidth self minimumWidth naturalWidth =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        pushPreferredWidth_
        (
          self
           & minimumWidth
           & naturalWidth
        )
    fun reset self = (GObjectObjectClass.C.withPtr ---> I) reset_ self
    local
      open Property
    in
      val areaProp =
        {
          get = fn x => get "area" GtkCellAreaClass.tOpt x,
          set = fn x => set "area" GtkCellAreaClass.tOpt x
        }
      val minimumHeightProp = {get = fn x => get "minimum-height" int x}
      val minimumWidthProp = {get = fn x => get "minimum-width" int x}
      val naturalHeightProp = {get = fn x => get "natural-height" int x}
      val naturalWidthProp = {get = fn x => get "natural-width" int x}
    end
  end
