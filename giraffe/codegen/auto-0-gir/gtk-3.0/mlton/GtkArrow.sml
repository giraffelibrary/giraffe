structure GtkArrow :>
  GTK_ARROW
    where type 'a class_t = 'a GtkArrowClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type arrowtype_t = GtkArrowType.t
    where type shadowtype_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_arrow_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_arrow_new" : GtkArrowType.C.val_ * GtkShadowType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val set_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_arrow_set" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkArrowType.C.val_
               * GtkShadowType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkArrowClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type arrowtype_t = GtkArrowType.t
    type shadowtype_t = GtkShadowType.t
    type t = base class_t
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
