structure GtkArrow :>
  GTK_ARROW
    where type 'a class = 'a GtkArrowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type arrow_type_t = GtkArrowType.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_arrow_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_arrow_new") (GtkArrowType.PolyML.cVal &&> GtkShadowType.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val set_ =
        call (load_sym libgtk "gtk_arrow_set")
          (
            GtkArrowClass.PolyML.cPtr
             &&> GtkArrowType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkArrowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type arrow_type_t = GtkArrowType.t
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new arrowType shadowType = (GtkArrowType.C.withVal &&&> GtkShadowType.C.withVal ---> GtkArrowClass.C.fromPtr false) new_ (arrowType & shadowType)
    fun set self arrowType shadowType =
      (
        GtkArrowClass.C.withPtr
         &&&> GtkArrowType.C.withVal
         &&&> GtkShadowType.C.withVal
         ---> I
      )
        set_
        (
          self
           & arrowType
           & shadowType
        )
    local
      open Property
    in
      val arrowTypeProp =
        {
          get = fn x => get "arrow-type" GtkArrowType.t x,
          set = fn x => set "arrow-type" GtkArrowType.t x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
    end
  end
