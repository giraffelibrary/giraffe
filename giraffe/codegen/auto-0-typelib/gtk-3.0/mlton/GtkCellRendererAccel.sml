structure GtkCellRendererAccel :>
  GTK_CELL_RENDERER_ACCEL
    where type 'a class = 'a GtkCellRendererAccelClass.class
    where type cell_renderer_accel_mode_t = GtkCellRendererAccelMode.t =
  struct
    val getType_ = _import "gtk_cell_renderer_accel_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_renderer_accel_new" : unit -> GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p;
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
                f
                  (
                    pathString,
                    accelKey,
                    accelMods,
                    hardwareKeycode
                  )
          )
    end
    local
      open ValueAccessor
    in
      val accelKeyProp =
        {
          name = "accel-key",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val accelModeProp =
        {
          name = "accel-mode",
          gtype = fn () => C.gtype GtkCellRendererAccelMode.t (),
          get = fn x => fn () => C.get GtkCellRendererAccelMode.t x,
          set = fn x => C.set GtkCellRendererAccelMode.t x,
          init = fn x => C.set GtkCellRendererAccelMode.t x
        }
      val accelModsProp =
        {
          name = "accel-mods",
          gtype = fn () => C.gtype GdkModifierType.t (),
          get = fn x => fn () => C.get GdkModifierType.t x,
          set = fn x => C.set GdkModifierType.t x,
          init = fn x => C.set GdkModifierType.t x
        }
      val keycodeProp =
        {
          name = "keycode",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
