structure GtkCellAreaContext :>
  GTK_CELL_AREA_CONTEXT
    where type 'a class = 'a GtkCellAreaContextClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_area_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val allocate_ =
        call (getSymbol "gtk_cell_area_context_allocate")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getAllocation_ =
        call (getSymbol "gtk_cell_area_context_get_allocation")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getArea_ = call (getSymbol "gtk_cell_area_context_get_area") (GtkCellAreaContextClass.PolyML.cPtr --> GtkCellAreaClass.PolyML.cPtr)
      val getPreferredHeight_ =
        call (getSymbol "gtk_cell_area_context_get_preferred_height")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeightForWidth_ =
        call (getSymbol "gtk_cell_area_context_get_preferred_height_for_width")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredWidth_ =
        call (getSymbol "gtk_cell_area_context_get_preferred_width")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredWidthForHeight_ =
        call (getSymbol "gtk_cell_area_context_get_preferred_width_for_height")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val pushPreferredHeight_ =
        call (getSymbol "gtk_cell_area_context_push_preferred_height")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val pushPreferredWidth_ =
        call (getSymbol "gtk_cell_area_context_push_preferred_width")
          (
            GtkCellAreaContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val reset_ = call (getSymbol "gtk_cell_area_context_reset") (GtkCellAreaContextClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkCellAreaContextClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun allocate self (width, height) =
      (
        GtkCellAreaContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
            GtkCellAreaContextClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getAllocation_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getArea self = (GtkCellAreaContextClass.FFI.withPtr ---> GtkCellAreaClass.FFI.fromPtr false) getArea_ self
    fun getPreferredHeight self =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaContextClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & GInt.null
               & GInt.null
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
            GtkCellAreaContextClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & width
               & GInt.null
               & GInt.null
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
            GtkCellAreaContextClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & GInt.null
               & GInt.null
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
            GtkCellAreaContextClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & height
               & GInt.null
               & GInt.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun pushPreferredHeight self (minimumHeight, naturalHeight) =
      (
        GtkCellAreaContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        pushPreferredHeight_
        (
          self
           & minimumHeight
           & naturalHeight
        )
    fun pushPreferredWidth self (minimumWidth, naturalWidth) =
      (
        GtkCellAreaContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        pushPreferredWidth_
        (
          self
           & minimumWidth
           & naturalWidth
        )
    fun reset self = (GtkCellAreaContextClass.FFI.withPtr ---> I) reset_ self
    local
      open Property
    in
      val areaProp =
        {
          get = fn x => get "area" GtkCellAreaClass.tOpt x,
          new = fn x => new "area" GtkCellAreaClass.tOpt x
        }
      val minimumHeightProp = {get = fn x => get "minimum-height" int x}
      val minimumWidthProp = {get = fn x => get "minimum-width" int x}
      val naturalHeightProp = {get = fn x => get "natural-height" int x}
      val naturalWidthProp = {get = fn x => get "natural-width" int x}
    end
  end
