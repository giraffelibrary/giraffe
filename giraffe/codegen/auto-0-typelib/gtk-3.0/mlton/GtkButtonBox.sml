structure GtkButtonBox :>
  GTK_BUTTON_BOX
    where type 'a class = 'a GtkButtonBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type button_box_style_t = GtkButtonBoxStyle.t =
  struct
    val getType_ = _import "gtk_button_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_button_box_new" : GtkOrientation.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getChildNonHomogeneous_ = fn x1 & x2 => (_import "gtk_button_box_get_child_non_homogeneous" : GtkButtonBoxClass.FFI.non_opt GtkButtonBoxClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getChildSecondary_ = fn x1 & x2 => (_import "gtk_button_box_get_child_secondary" : GtkButtonBoxClass.FFI.non_opt GtkButtonBoxClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getLayout_ = _import "gtk_button_box_get_layout" : GtkButtonBoxClass.FFI.non_opt GtkButtonBoxClass.FFI.p -> GtkButtonBoxStyle.FFI.val_;
    val setChildNonHomogeneous_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_box_set_child_non_homogeneous" :
              GtkButtonBoxClass.FFI.non_opt GtkButtonBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setChildSecondary_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_box_set_child_secondary" :
              GtkButtonBoxClass.FFI.non_opt GtkButtonBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLayout_ = fn x1 & x2 => (_import "gtk_button_box_set_layout" : GtkButtonBoxClass.FFI.non_opt GtkButtonBoxClass.FFI.p * GtkButtonBoxStyle.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkButtonBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type button_box_style_t = GtkButtonBoxStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new orientation = (GtkOrientation.FFI.withVal ---> GtkButtonBoxClass.FFI.fromPtr false) new_ orientation
    fun getChildNonHomogeneous self child = (GtkButtonBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getChildNonHomogeneous_ (self & child)
    fun getChildSecondary self child = (GtkButtonBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getChildSecondary_ (self & child)
    fun getLayout self = (GtkButtonBoxClass.FFI.withPtr false ---> GtkButtonBoxStyle.FFI.fromVal) getLayout_ self
    fun setChildNonHomogeneous self (child, nonHomogeneous) =
      (
        GtkButtonBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setChildNonHomogeneous_
        (
          self
           & child
           & nonHomogeneous
        )
    fun setChildSecondary self (child, isSecondary) =
      (
        GtkButtonBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setChildSecondary_
        (
          self
           & child
           & isSecondary
        )
    fun setLayout self layoutStyle = (GtkButtonBoxClass.FFI.withPtr false &&&> GtkButtonBoxStyle.FFI.withVal ---> I) setLayout_ (self & layoutStyle)
    local
      open ValueAccessor
    in
      val layoutStyleProp =
        {
          name = "layout-style",
          gtype = fn () => C.gtype GtkButtonBoxStyle.t (),
          get = fn x => fn () => C.get GtkButtonBoxStyle.t x,
          set = fn x => C.set GtkButtonBoxStyle.t x,
          init = fn x => C.set GtkButtonBoxStyle.t x
        }
    end
  end
