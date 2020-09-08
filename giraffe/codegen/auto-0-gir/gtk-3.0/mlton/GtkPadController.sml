structure GtkPadController :>
  GTK_PAD_CONTROLLER
    where type 'a class = 'a GtkPadControllerClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type pad_action_type_t = GtkPadActionType.t =
  struct
    val getType_ = _import "gtk_pad_controller_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_pad_controller_new" :
              GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p
               * GioActionGroupClass.FFI.non_opt GioActionGroupClass.FFI.p
               * GdkDeviceClass.FFI.opt GdkDeviceClass.FFI.p
               -> GtkPadControllerClass.FFI.non_opt GtkPadControllerClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setAction_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_pad_controller_set_action" :
              GtkPadControllerClass.FFI.non_opt GtkPadControllerClass.FFI.p
               * GtkPadActionType.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    type 'a class = 'a GtkPadControllerClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type pad_action_type_t = GtkPadActionType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        window,
        group,
        pad
      ) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GioActionGroupClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withOptPtr false
         ---> GtkPadControllerClass.FFI.fromPtr true
      )
        new_
        (
          window
           & group
           & pad
        )
    fun setAction
      self
      (
        type',
        index,
        mode,
        label,
        actionName
      ) =
      (
        GtkPadControllerClass.FFI.withPtr false
         &&&> GtkPadActionType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setAction_
        (
          self
           & type'
           & index
           & mode
           & label
           & actionName
        )
    local
      open ValueAccessor
    in
      val actionGroupProp =
        {
          name = "action-group",
          gtype = fn () => C.gtype GioActionGroupClass.tOpt (),
          get = fn x => fn () => C.get GioActionGroupClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioActionGroupClass.tOpt x
        }
      val padProp =
        {
          name = "pad",
          gtype = fn () => C.gtype GdkDeviceClass.tOpt (),
          get = fn x => fn () => C.get GdkDeviceClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDeviceClass.tOpt x
        }
    end
  end
