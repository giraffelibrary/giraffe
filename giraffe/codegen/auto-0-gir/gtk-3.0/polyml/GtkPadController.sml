structure GtkPadController :>
  GTK_PAD_CONTROLLER
    where type 'a class = 'a GtkPadControllerClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type pad_action_type_t = GtkPadActionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_pad_controller_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_pad_controller_new")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GioActionGroupClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cOptPtr
             --> GtkPadControllerClass.PolyML.cPtr
          )
      val setAction_ =
        call (getSymbol "gtk_pad_controller_set_action")
          (
            GtkPadControllerClass.PolyML.cPtr
             &&> GtkPadActionType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
    end
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
