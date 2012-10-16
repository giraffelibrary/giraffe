structure GtkLayout :>
  GTK_LAYOUT
    where type 'a class_t = 'a GtkLayoutClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_layout_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_layout_new" : unit GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getBinWindow_ = _import "gtk_layout_get_bin_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_layout_get_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word32.ref_
               * FFI.Word32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val move_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_layout_move" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val put_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_layout_put" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_layout_set_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word32.val_
               * FFI.Word32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkLayoutClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GObjectObjectClass.C.withOptPtr &&&> GObjectObjectClass.C.withOptPtr ---> GtkLayoutClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Word32.withRefVal
             &&&> FFI.Word32.withRefVal
             ---> FFI.Word32.fromVal
                   && FFI.Word32.fromVal
                   && I
          )
            getSize_
            (
              self
               & 0
               & 0
            )
      in
        (width, height)
      end
    fun move self childWidget x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        move_
        (
          self
           & childWidget
           & x
           & y
        )
    fun put self childWidget x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        put_
        (
          self
           & childWidget
           & x
           & y
        )
    fun setSize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
        )
    local
      open Property
    in
      val heightProp =
        {
          get = fn x => get "height" uint x,
          set = fn x => set "height" uint x
        }
      val widthProp =
        {
          get = fn x => get "width" uint x,
          set = fn x => set "width" uint x
        }
    end
  end
