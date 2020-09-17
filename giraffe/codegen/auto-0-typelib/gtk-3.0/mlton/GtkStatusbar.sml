structure GtkStatusbar :>
  GTK_STATUSBAR
    where type 'a class = 'a GtkStatusbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a box_class = 'a GtkBoxClass.class =
  struct
    val getType_ = _import "gtk_statusbar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_statusbar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getContextId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_statusbar_get_context_id" :
              GtkStatusbarClass.FFI.non_opt GtkStatusbarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getMessageArea_ = _import "gtk_statusbar_get_message_area" : GtkStatusbarClass.FFI.non_opt GtkStatusbarClass.FFI.p -> GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p;
    val pop_ = fn x1 & x2 => (_import "gtk_statusbar_pop" : GtkStatusbarClass.FFI.non_opt GtkStatusbarClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val push_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_statusbar_push" :
              GtkStatusbarClass.FFI.non_opt GtkStatusbarClass.FFI.p
               * GUInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val remove_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_statusbar_remove" :
              GtkStatusbarClass.FFI.non_opt GtkStatusbarClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeAll_ = fn x1 & x2 => (_import "gtk_statusbar_remove_all" : GtkStatusbarClass.FFI.non_opt GtkStatusbarClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkStatusbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a box_class = 'a GtkBoxClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStatusbarClass.FFI.fromPtr false) new_ ()
    fun getContextId self contextDescription = (GtkStatusbarClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GUInt32.FFI.fromVal) getContextId_ (self & contextDescription)
    fun getMessageArea self = (GtkStatusbarClass.FFI.withPtr false ---> GtkBoxClass.FFI.fromPtr false) getMessageArea_ self before GtkStatusbarClass.FFI.touchPtr self
    fun pop self contextId = (GtkStatusbarClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) pop_ (self & contextId)
    fun push self (contextId, text) =
      (
        GtkStatusbarClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GUInt32.FFI.fromVal
      )
        push_
        (
          self
           & contextId
           & text
        )
    fun remove self (contextId, messageId) =
      (
        GtkStatusbarClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        remove_
        (
          self
           & contextId
           & messageId
        )
    fun removeAll self contextId = (GtkStatusbarClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) removeAll_ (self & contextId)
    local
      open ClosureMarshal Signal
    in
      fun textPoppedSig f = signal "text-popped" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f (contextId, text))
      fun textPushedSig f = signal "text-pushed" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f (contextId, text))
    end
  end
