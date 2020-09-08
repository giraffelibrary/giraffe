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
      val getType_ = call (getSymbol "gtk_arrow_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_arrow_new") (GtkArrowType.PolyML.cVal &&> GtkShadowType.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val set_ =
        call (getSymbol "gtk_arrow_set")
          (
            GtkArrowClass.PolyML.cPtr
             &&> GtkArrowType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkArrowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type arrow_type_t = GtkArrowType.t
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (arrowType, shadowType) = (GtkArrowType.FFI.withVal &&&> GtkShadowType.FFI.withVal ---> GtkArrowClass.FFI.fromPtr false) new_ (arrowType & shadowType)
    fun set self (arrowType, shadowType) =
      (
        GtkArrowClass.FFI.withPtr false
         &&&> GtkArrowType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         ---> I
      )
        set_
        (
          self
           & arrowType
           & shadowType
        )
    local
      open ValueAccessor
    in
      val arrowTypeProp =
        {
          name = "arrow-type",
          gtype = fn () => C.gtype GtkArrowType.t (),
          get = fn x => fn () => C.get GtkArrowType.t x,
          set = fn x => C.set GtkArrowType.t x,
          init = fn x => C.set GtkArrowType.t x
        }
      val shadowTypeProp =
        {
          name = "shadow-type",
          gtype = fn () => C.gtype GtkShadowType.t (),
          get = fn x => fn () => C.get GtkShadowType.t x,
          set = fn x => C.set GtkShadowType.t x,
          init = fn x => C.set GtkShadowType.t x
        }
    end
  end
