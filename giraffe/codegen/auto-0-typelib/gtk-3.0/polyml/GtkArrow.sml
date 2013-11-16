structure GtkArrow :>
  GTK_ARROW
    where type 'a class_t = 'a GtkArrowClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type arrowtype_t = GtkArrowType.t
    where type shadowtype_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_arrow_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_arrow_new") (GtkArrowType.PolyML.VAL &&> GtkShadowType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val set_ =
        call (load_sym libgtk "gtk_arrow_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkArrowType.PolyML.VAL
             &&> GtkShadowType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkArrowClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type arrowtype_t = GtkArrowType.t
    type shadowtype_t = GtkShadowType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new arrowType shadowType = (GtkArrowType.C.withVal &&&> GtkShadowType.C.withVal ---> GtkArrowClass.C.fromPtr false) new_ (arrowType & shadowType)
    fun set self arrowType shadowType =
      (
        GObjectObjectClass.C.withPtr
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
