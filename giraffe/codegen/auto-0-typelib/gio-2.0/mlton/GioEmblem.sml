structure GioEmblem :>
  GIO_EMBLEM
    where type 'a class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type emblem_origin_t = GioEmblemOrigin.t =
  struct
    val getType_ = _import "g_emblem_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_emblem_new" : GioIconClass.FFI.notnull GioIconClass.FFI.p -> GioEmblemClass.FFI.notnull GioEmblemClass.FFI.p;
    val newWithOrigin_ = fn x1 & x2 => (_import "g_emblem_new_with_origin" : GioIconClass.FFI.notnull GioIconClass.FFI.p * GioEmblemOrigin.FFI.val_ -> GioEmblemClass.FFI.notnull GioEmblemClass.FFI.p;) (x1, x2)
    val getIcon_ = _import "g_emblem_get_icon" : GioEmblemClass.FFI.notnull GioEmblemClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getOrigin_ = _import "g_emblem_get_origin" : GioEmblemClass.FFI.notnull GioEmblemClass.FFI.p -> GioEmblemOrigin.FFI.val_;
    type 'a class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type emblem_origin_t = GioEmblemOrigin.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new icon = (GioIconClass.FFI.withPtr ---> GioEmblemClass.FFI.fromPtr true) new_ icon
    fun newWithOrigin icon origin = (GioIconClass.FFI.withPtr &&&> GioEmblemOrigin.FFI.withVal ---> GioEmblemClass.FFI.fromPtr true) newWithOrigin_ (icon & origin)
    fun getIcon self = (GioEmblemClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getIcon_ self
    fun getOrigin self = (GioEmblemClass.FFI.withPtr ---> GioEmblemOrigin.FFI.fromVal) getOrigin_ self
    local
      open Property
    in
      val iconProp =
        {
          get = fn x => get "icon" GObjectObjectClass.tOpt x,
          set = fn x => set "icon" GObjectObjectClass.tOpt x
        }
      val originProp =
        {
          get = fn x => get "origin" GioEmblemOrigin.t x,
          set = fn x => set "origin" GioEmblemOrigin.t x
        }
    end
  end
