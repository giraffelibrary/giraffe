structure GtkLayout :>
  GTK_LAYOUT
    where type 'a class = 'a GtkLayoutClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_layout_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_layout_new" : GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getBinWindow_ = _import "gtk_layout_get_bin_window" : GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getHadjustment_ = _import "gtk_layout_get_hadjustment" : GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_layout_get_size" :
              GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getVadjustment_ = _import "gtk_layout_get_vadjustment" : GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val move_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_layout_move" :
              GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
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
              GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_layout_set_hadjustment" : GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_layout_set_size" :
              GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_layout_set_vadjustment" : GtkLayoutClass.FFI.non_opt GtkLayoutClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkLayoutClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (hadjustment, vadjustment) = (GtkAdjustmentClass.FFI.withOptPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> GtkLayoutClass.FFI.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GtkLayoutClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getBinWindow_ self
    fun getHadjustment self = (GtkLayoutClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkLayoutClass.FFI.withPtr false
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GUInt.null
               & GUInt.null
            )
      in
        (width, height)
      end
    fun getVadjustment self = (GtkLayoutClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun move
      self
      (
        childWidget,
        x,
        y
      ) =
      (
        GtkLayoutClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & childWidget
           & x
           & y
        )
    fun put
      self
      (
        childWidget,
        x,
        y
      ) =
      (
        GtkLayoutClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        put_
        (
          self
           & childWidget
           & x
           & y
        )
    fun setHadjustment self adjustment = (GtkLayoutClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setHadjustment_ (self & adjustment)
    fun setSize self (width, height) =
      (
        GtkLayoutClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
        )
    fun setVadjustment self adjustment = (GtkLayoutClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setVadjustment_ (self & adjustment)
    local
      open Property
    in
      val heightProp =
        {
          get = fn x => get "height" uint x,
          set = fn x => set "height" uint x,
          new = fn x => new "height" uint x
        }
      val widthProp =
        {
          get = fn x => get "width" uint x,
          set = fn x => set "width" uint x,
          new = fn x => new "width" uint x
        }
    end
  end
