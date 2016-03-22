structure GtkLayout :>
  GTK_LAYOUT
    where type 'a class = 'a GtkLayoutClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_layout_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_layout_new" : unit GtkAdjustmentClass.C.p * unit GtkAdjustmentClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val getBinWindow_ = _import "gtk_layout_get_bin_window" : GtkLayoutClass.C.notnull GtkLayoutClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_layout_get_size" :
              GtkLayoutClass.C.notnull GtkLayoutClass.C.p
               * FFI.UInt.C.ref_
               * FFI.UInt.C.ref_
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
              GtkLayoutClass.C.notnull GtkLayoutClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
              GtkLayoutClass.C.notnull GtkLayoutClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
              GtkLayoutClass.C.notnull GtkLayoutClass.C.p
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkLayoutClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GtkAdjustmentClass.C.withOptPtr &&&> GtkAdjustmentClass.C.withOptPtr ---> GtkLayoutClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GtkLayoutClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkLayoutClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.UInt.null
               & FFI.UInt.null
            )
      in
        (width, height)
      end
    fun move self childWidget x y =
      (
        GtkLayoutClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
        GtkLayoutClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
        GtkLayoutClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
