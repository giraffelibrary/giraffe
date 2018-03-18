structure GtkOrientable :>
  GTK_ORIENTABLE
    where type 'a class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_orientable_get_type" : unit -> GObjectType.FFI.val_;
    val getOrientation_ = _import "gtk_orientable_get_orientation" : GtkOrientableClass.FFI.notnull GtkOrientableClass.FFI.p -> GtkOrientation.FFI.val_;
    val setOrientation_ = fn x1 & x2 => (_import "gtk_orientable_set_orientation" : GtkOrientableClass.FFI.notnull GtkOrientableClass.FFI.p * GtkOrientation.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getOrientation self = (GtkOrientableClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun setOrientation self orientation = (GtkOrientableClass.FFI.withPtr &&&> GtkOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    local
      open Property
    in
      val orientationProp =
        {
          get = fn x => get "orientation" GtkOrientation.t x,
          set = fn x => set "orientation" GtkOrientation.t x,
          new = fn x => new "orientation" GtkOrientation.t x
        }
    end
  end
