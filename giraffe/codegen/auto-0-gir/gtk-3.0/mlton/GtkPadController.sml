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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * unit GdkDeviceClass.FFI.p
               -> GtkPadControllerClass.FFI.notnull GtkPadControllerClass.FFI.p;
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
              GtkPadControllerClass.FFI.notnull GtkPadControllerClass.FFI.p
               * GtkPadActionType.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
        GtkWindowClass.FFI.withPtr
         &&&> GioActionGroupClass.FFI.withPtr
         &&&> GdkDeviceClass.FFI.withOptPtr
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
        GtkPadControllerClass.FFI.withPtr
         &&&> GtkPadActionType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
      open Property
    in
      val actionGroupProp =
        {
          get = fn x => get "action-group" GioActionGroupClass.tOpt x,
          new = fn x => new "action-group" GioActionGroupClass.tOpt x
        }
      val padProp =
        {
          get = fn x => get "pad" GdkDeviceClass.tOpt x,
          new = fn x => new "pad" GdkDeviceClass.tOpt x
        }
    end
  end
