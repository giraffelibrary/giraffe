structure GtkButtonBox :>
  GTK_BUTTON_BOX
    where type 'a class = 'a GtkButtonBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type button_box_style_t = GtkButtonBoxStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_button_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_button_box_new") (GtkOrientation.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getChildNonHomogeneous_ = call (getSymbol "gtk_button_box_get_child_non_homogeneous") (GtkButtonBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getChildSecondary_ = call (getSymbol "gtk_button_box_get_child_secondary") (GtkButtonBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLayout_ = call (getSymbol "gtk_button_box_get_layout") (GtkButtonBoxClass.PolyML.cPtr --> GtkButtonBoxStyle.PolyML.cVal)
      val setChildNonHomogeneous_ =
        call (getSymbol "gtk_button_box_set_child_non_homogeneous")
          (
            GtkButtonBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setChildSecondary_ =
        call (getSymbol "gtk_button_box_set_child_secondary")
          (
            GtkButtonBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setLayout_ = call (getSymbol "gtk_button_box_set_layout") (GtkButtonBoxClass.PolyML.cPtr &&> GtkButtonBoxStyle.PolyML.cVal --> cVoid)
    end
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
      open Property
    in
      val layoutStyleProp =
        {
          get = fn x => get "layout-style" GtkButtonBoxStyle.t x,
          set = fn x => set "layout-style" GtkButtonBoxStyle.t x,
          new = fn x => new "layout-style" GtkButtonBoxStyle.t x
        }
    end
  end
