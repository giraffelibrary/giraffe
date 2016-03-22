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
      val getType_ = call (load_sym libgtk "gtk_button_box_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_button_box_new") (GtkOrientation.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getChildNonHomogeneous_ = call (load_sym libgtk "gtk_button_box_get_child_non_homogeneous") (GtkButtonBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getChildSecondary_ = call (load_sym libgtk "gtk_button_box_get_child_secondary") (GtkButtonBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLayout_ = call (load_sym libgtk "gtk_button_box_get_layout") (GtkButtonBoxClass.PolyML.cPtr --> GtkButtonBoxStyle.PolyML.cVal)
      val setChildNonHomogeneous_ =
        call (load_sym libgtk "gtk_button_box_set_child_non_homogeneous")
          (
            GtkButtonBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setChildSecondary_ =
        call (load_sym libgtk "gtk_button_box_set_child_secondary")
          (
            GtkButtonBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setLayout_ = call (load_sym libgtk "gtk_button_box_set_layout") (GtkButtonBoxClass.PolyML.cPtr &&> GtkButtonBoxStyle.PolyML.cVal --> FFI.PolyML.cVoid)
    end
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
