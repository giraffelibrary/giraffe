structure GtkOrientable :>
  GTK_ORIENTABLE
    where type 'a class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_orientable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getOrientation_ = call (getSymbol "gtk_orientable_get_orientation") (GtkOrientableClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val setOrientation_ = call (getSymbol "gtk_orientable_set_orientation") (GtkOrientableClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getOrientation self = (GtkOrientableClass.FFI.withPtr false ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun setOrientation self orientation = (GtkOrientableClass.FFI.withPtr false &&&> GtkOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    local
      open ValueAccessor
    in
      val orientationProp =
        {
          name = "orientation",
          gtype = fn () => C.gtype GtkOrientation.t (),
          get = fn x => fn () => C.get GtkOrientation.t x,
          set = fn x => C.set GtkOrientation.t x,
          init = fn x => C.set GtkOrientation.t x
        }
    end
  end
