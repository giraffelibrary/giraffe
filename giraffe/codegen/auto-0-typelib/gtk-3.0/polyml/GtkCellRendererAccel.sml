structure GtkCellRendererAccel :>
  GTK_CELL_RENDERER_ACCEL
    where type 'a class = 'a GtkCellRendererAccelClass.class
    where type cell_renderer_accel_mode_t = GtkCellRendererAccelMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_accel_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_renderer_accel_new") (cVoid --> GtkCellRendererClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCellRendererAccelClass.class
    type cell_renderer_accel_mode_t = GtkCellRendererAccelMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererAccelClass.FFI.fromPtr false) new_ ()
    local
      open ClosureMarshal Signal
    in
      fun accelClearedSig f = signal "accel-cleared" (get 0w1 string ---> ret_void) f
      fun accelEditedSig f =
        signal "accel-edited"
          (
            get 0w1 string
             &&&> get 0w2 uint
             &&&> get 0w3 GdkModifierType.t
             &&&> get 0w4 uint
             ---> ret_void
          )
          (
            fn
              pathString
               & accelKey
               & accelMods
               & hardwareKeycode =>
                f pathString accelKey accelMods hardwareKeycode
          )
    end
    local
      open Property
    in
      val accelKeyProp =
        {
          get = fn x => get "accel-key" uint x,
          set = fn x => set "accel-key" uint x
        }
      val accelModeProp =
        {
          get = fn x => get "accel-mode" GtkCellRendererAccelMode.t x,
          set = fn x => set "accel-mode" GtkCellRendererAccelMode.t x
        }
      val accelModsProp =
        {
          get = fn x => get "accel-mods" GdkModifierType.t x,
          set = fn x => set "accel-mods" GdkModifierType.t x
        }
      val keycodeProp =
        {
          get = fn x => get "keycode" uint x,
          set = fn x => set "keycode" uint x
        }
    end
  end
