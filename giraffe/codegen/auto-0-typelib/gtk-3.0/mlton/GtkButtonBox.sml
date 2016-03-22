structure GtkButtonBox :>
  GTK_BUTTON_BOX
    where type 'a class = 'a GtkButtonBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type button_box_style_t = GtkButtonBoxStyle.t =
  struct
    val getType_ = _import "gtk_button_box_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_button_box_new" : GtkOrientation.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getChildNonHomogeneous_ = fn x1 & x2 => (_import "gtk_button_box_get_child_non_homogeneous" : GtkButtonBoxClass.C.notnull GtkButtonBoxClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getChildSecondary_ = fn x1 & x2 => (_import "gtk_button_box_get_child_secondary" : GtkButtonBoxClass.C.notnull GtkButtonBoxClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getLayout_ = _import "gtk_button_box_get_layout" : GtkButtonBoxClass.C.notnull GtkButtonBoxClass.C.p -> GtkButtonBoxStyle.C.val_;
    val setChildNonHomogeneous_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_box_set_child_non_homogeneous" :
              GtkButtonBoxClass.C.notnull GtkButtonBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
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
              GtkButtonBoxClass.C.notnull GtkButtonBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLayout_ = fn x1 & x2 => (_import "gtk_button_box_set_layout" : GtkButtonBoxClass.C.notnull GtkButtonBoxClass.C.p * GtkButtonBoxStyle.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkButtonBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type button_box_style_t = GtkButtonBoxStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation = (GtkOrientation.C.withVal ---> GtkButtonBoxClass.C.fromPtr false) new_ orientation
    fun getChildNonHomogeneous self child = (GtkButtonBoxClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildNonHomogeneous_ (self & child)
    fun getChildSecondary self child = (GtkButtonBoxClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildSecondary_ (self & child)
    fun getLayout self = (GtkButtonBoxClass.C.withPtr ---> GtkButtonBoxStyle.C.fromVal) getLayout_ self
    fun setChildNonHomogeneous self child nonHomogeneous =
      (
        GtkButtonBoxClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setChildNonHomogeneous_
        (
          self
           & child
           & nonHomogeneous
        )
    fun setChildSecondary self child isSecondary =
      (
        GtkButtonBoxClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setChildSecondary_
        (
          self
           & child
           & isSecondary
        )
    fun setLayout self layoutStyle = (GtkButtonBoxClass.C.withPtr &&&> GtkButtonBoxStyle.C.withVal ---> I) setLayout_ (self & layoutStyle)
    local
      open Property
    in
      val layoutStyleProp =
        {
          get = fn x => get "layout-style" GtkButtonBoxStyle.t x,
          set = fn x => set "layout-style" GtkButtonBoxStyle.t x
        }
    end
  end
