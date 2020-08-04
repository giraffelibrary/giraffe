structure GioEmblemedIcon :>
  GIO_EMBLEMED_ICON
    where type 'a class = 'a GioEmblemedIconClass.class
    where type 'a emblem_class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_emblemed_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_emblemed_icon_new" : GioIconClass.FFI.non_opt GioIconClass.FFI.p * GioEmblemClass.FFI.opt GioEmblemClass.FFI.p -> GioEmblemedIconClass.FFI.non_opt GioEmblemedIconClass.FFI.p;) (x1, x2)
    val addEmblem_ = fn x1 & x2 => (_import "g_emblemed_icon_add_emblem" : GioEmblemedIconClass.FFI.non_opt GioEmblemedIconClass.FFI.p * GioEmblemClass.FFI.non_opt GioEmblemClass.FFI.p -> unit;) (x1, x2)
    val clearEmblems_ = _import "g_emblemed_icon_clear_emblems" : GioEmblemedIconClass.FFI.non_opt GioEmblemedIconClass.FFI.p -> unit;
    val getIcon_ = _import "g_emblemed_icon_get_icon" : GioEmblemedIconClass.FFI.non_opt GioEmblemedIconClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    type 'a class = 'a GioEmblemedIconClass.class
    type 'a emblem_class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (icon, emblem) = (GioIconClass.FFI.withPtr false &&&> GioEmblemClass.FFI.withOptPtr false ---> GioEmblemedIconClass.FFI.fromPtr true) new_ (icon & emblem)
    fun addEmblem self emblem = (GioEmblemedIconClass.FFI.withPtr false &&&> GioEmblemClass.FFI.withPtr false ---> I) addEmblem_ (self & emblem)
    fun clearEmblems self = (GioEmblemedIconClass.FFI.withPtr false ---> I) clearEmblems_ self
    fun getIcon self = (GioEmblemedIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getIcon_ self
    local
      open Property
    in
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          new = fn x => new "gicon" GioIconClass.tOpt x
        }
    end
  end
