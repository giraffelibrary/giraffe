structure GtkButtonBox :>
  GTK_BUTTON_BOX
    where type 'a class_t = 'a GtkButtonBoxClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type buttonboxstyle_t = GtkButtonBoxStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_button_box_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_button_box_new") (GtkOrientation.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getChildNonHomogeneous_ = call (load_sym libgtk "gtk_button_box_get_child_non_homogeneous") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getChildSecondary_ = call (load_sym libgtk "gtk_button_box_get_child_secondary") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getLayout_ = call (load_sym libgtk "gtk_button_box_get_layout") (GObjectObjectClass.PolyML.PTR --> GtkButtonBoxStyle.PolyML.VAL)
      val setChildNonHomogeneous_ =
        call (load_sym libgtk "gtk_button_box_set_child_non_homogeneous")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setChildSecondary_ =
        call (load_sym libgtk "gtk_button_box_set_child_secondary")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setLayout_ = call (load_sym libgtk "gtk_button_box_set_layout") (GObjectObjectClass.PolyML.PTR &&> GtkButtonBoxStyle.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkButtonBoxClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type orientation_t = GtkOrientation.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type buttonboxstyle_t = GtkButtonBoxStyle.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation = (GtkOrientation.C.withVal ---> GtkButtonBoxClass.C.fromPtr false) new_ orientation
    fun getChildNonHomogeneous self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildNonHomogeneous_ (self & child)
    fun getChildSecondary self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildSecondary_ (self & child)
    fun getLayout self = (GObjectObjectClass.C.withPtr ---> GtkButtonBoxStyle.C.fromVal) getLayout_ self
    fun setChildNonHomogeneous self child nonHomogeneous =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setChildSecondary_
        (
          self
           & child
           & isSecondary
        )
    fun setLayout self layoutStyle = (GObjectObjectClass.C.withPtr &&&> GtkButtonBoxStyle.C.withVal ---> I) setLayout_ (self & layoutStyle)
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
