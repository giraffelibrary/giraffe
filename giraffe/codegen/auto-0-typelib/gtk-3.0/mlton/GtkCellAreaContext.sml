structure GtkCellAreaContext :>
  GTK_CELL_AREA_CONTEXT
    where type 'a class = 'a GtkCellAreaContextClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class =
  struct
    val getType_ = _import "gtk_cell_area_context_get_type" : unit -> GObjectType.FFI.val_;
    val allocate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_allocate" :
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getArea_ = _import "gtk_cell_area_context_get_area" : GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p -> GtkCellAreaClass.FFI.non_opt GtkCellAreaClass.FFI.p;
    val getPreferredHeight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_context_get_preferred_height" :
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reset_ = _import "gtk_cell_area_context_reset" : GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p -> unit;
    type 'a class = 'a GtkCellAreaContextClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun allocate self (width, height) =
      (
        GtkCellAreaContextClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
            GtkCellAreaContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getAllocation_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun getArea self = (GtkCellAreaContextClass.FFI.withPtr false ---> GtkCellAreaClass.FFI.fromPtr false) getArea_ self before GtkCellAreaContextClass.FFI.touchPtr self
    fun getPreferredHeight self =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & GInt32.null
               & GInt32.null
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
            GtkCellAreaContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & width
               & GInt32.null
               & GInt32.null
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
            GtkCellAreaContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & GInt32.null
               & GInt32.null
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
            GtkCellAreaContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & height
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun pushPreferredHeight self (minimumHeight, naturalHeight) =
      (
        GtkCellAreaContextClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        GtkCellAreaContextClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        pushPreferredWidth_
        (
          self
           & minimumWidth
           & naturalWidth
        )
    fun reset self = (GtkCellAreaContextClass.FFI.withPtr false ---> I) reset_ self
    local
      open ValueAccessor
    in
      val areaProp =
        {
          name = "area",
          gtype = fn () => C.gtype GtkCellAreaClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaClass.tOpt x
        }
      val minimumHeightProp =
        {
          name = "minimum-height",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val minimumWidthProp =
        {
          name = "minimum-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val naturalHeightProp =
        {
          name = "natural-height",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val naturalWidthProp =
        {
          name = "natural-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
    end
  end
