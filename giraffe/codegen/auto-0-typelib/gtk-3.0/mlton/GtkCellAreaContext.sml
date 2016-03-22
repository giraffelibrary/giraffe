structure GtkCellAreaContext :>
  GTK_CELL_AREA_CONTEXT
    where type 'a class = 'a GtkCellAreaContextClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class =
  struct
    val getType_ = _import "gtk_cell_area_context_get_type" : unit -> GObjectType.C.val_;
    val allocate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_allocate" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAllocation_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_get_allocation" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getArea_ = _import "gtk_cell_area_context_get_area" : GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p -> GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p;
    val getPreferredHeight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_get_preferred_height" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredHeightForWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_area_context_get_preferred_height_for_width" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPreferredWidth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_get_preferred_width" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredWidthForHeight_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_area_context_get_preferred_width_for_height" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val pushPreferredHeight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_push_preferred_height" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pushPreferredWidth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_push_preferred_width" :
              GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reset_ = _import "gtk_cell_area_context_reset" : GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p -> unit;
    type 'a class = 'a GtkCellAreaContextClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun allocate self width height =
      (
        GtkCellAreaContextClass.C.withPtr
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
            GtkCellAreaContextClass.C.withPtr
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
    fun getArea self = (GtkCellAreaContextClass.C.withPtr ---> GtkCellAreaClass.C.fromPtr false) getArea_ self
    fun getPreferredHeight self =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaContextClass.C.withPtr
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
            GtkCellAreaContextClass.C.withPtr
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
            GtkCellAreaContextClass.C.withPtr
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
            GtkCellAreaContextClass.C.withPtr
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
        GtkCellAreaContextClass.C.withPtr
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
        GtkCellAreaContextClass.C.withPtr
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
