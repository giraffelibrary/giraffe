structure GtkCellAreaContext :>
  GTK_CELL_AREA_CONTEXT
    where type 'a class = 'a GtkCellAreaContextClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_area_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val allocate_ =
        call (load_sym libgtk "gtk_cell_area_context_allocate")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getAllocation_ =
        call (load_sym libgtk "gtk_cell_area_context_get_allocation")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getArea_ = call (load_sym libgtk "gtk_cell_area_context_get_area") (GtkCellAreaContextClass.PolyML.cPtr --> GtkCellAreaClass.PolyML.cPtr)
      val getPreferredHeight_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_height")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredHeightForWidth_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_height_for_width")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredWidth_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_width")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredWidthForHeight_ =
        call (load_sym libgtk "gtk_cell_area_context_get_preferred_width_for_height")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val pushPreferredHeight_ =
        call (load_sym libgtk "gtk_cell_area_context_push_preferred_height")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val pushPreferredWidth_ =
        call (load_sym libgtk "gtk_cell_area_context_push_preferred_width")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val reset_ = call (load_sym libgtk "gtk_cell_area_context_reset") (GtkCellAreaContextClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkCellAreaContextClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun allocate self width height =
      (
        GtkCellAreaContextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
            GtkCellAreaContextClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getAllocation_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (width, height)
      end
    fun getArea self = (GtkCellAreaContextClass.C.withPtr ---> GtkCellAreaClass.C.fromPtr false) getArea_ self
    fun getPreferredHeight self =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaContextClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
            GtkCellAreaContextClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & width
               & FFI.Int.null
               & FFI.Int.null
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
            GtkCellAreaContextClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
            GtkCellAreaContextClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & height
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun pushPreferredHeight self minimumHeight naturalHeight =
      (
        GtkCellAreaContextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
        GtkCellAreaContextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        pushPreferredWidth_
        (
          self
           & minimumWidth
           & naturalWidth
        )
    fun reset self = (GtkCellAreaContextClass.C.withPtr ---> I) reset_ self
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
