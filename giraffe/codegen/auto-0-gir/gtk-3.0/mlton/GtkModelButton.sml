structure GtkModelButton :>
  GTK_MODEL_BUTTON
    where type 'a class = 'a GtkModelButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type button_role_t = GtkButtonRole.t =
  struct
    val getType_ = _import "gtk_model_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_model_button_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkModelButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type button_role_t = GtkButtonRole.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkModelButtonClass.FFI.fromPtr false) new_ ()
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
      val centeredProp =
        {
          get = fn x => get "centered" boolean x,
          set = fn x => set "centered" boolean x
        }
      val iconProp =
        {
          get = fn x => get "icon" GioIconClass.tOpt x,
          set = fn x => set "icon" GioIconClass.tOpt x
        }
      val iconicProp =
        {
          get = fn x => get "iconic" boolean x,
          set = fn x => set "iconic" boolean x
        }
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x
        }
      val menuNameProp =
        {
          get = fn x => get "menu-name" stringOpt x,
          set = fn x => set "menu-name" stringOpt x
        }
      val roleProp =
        {
          get = fn x => get "role" GtkButtonRole.t x,
          set = fn x => set "role" GtkButtonRole.t x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
