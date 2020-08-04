structure GtkArrow :>
  GTK_ARROW
    where type 'a class = 'a GtkArrowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type arrow_type_t = GtkArrowType.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_arrow_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_arrow_new" : GtkArrowType.FFI.val_ * GtkShadowType.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val set_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_arrow_set" :
              GtkArrowClass.FFI.non_opt GtkArrowClass.FFI.p
               * GtkArrowType.FFI.val_
               * GtkShadowType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
      open Property
    in
      val arrowTypeProp =
        {
          get = fn x => get "arrow-type" GtkArrowType.t x,
          set = fn x => set "arrow-type" GtkArrowType.t x,
          new = fn x => new "arrow-type" GtkArrowType.t x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x,
          new = fn x => new "shadow-type" GtkShadowType.t x
        }
    end
  end
