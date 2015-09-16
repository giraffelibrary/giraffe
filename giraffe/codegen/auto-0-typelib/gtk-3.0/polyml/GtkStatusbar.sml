structure GtkStatusbar :>
  GTK_STATUSBAR
    where type 'a class_t = 'a GtkStatusbarClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_statusbar_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_statusbar_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getContextId_ = call (load_sym libgtk "gtk_statusbar_get_context_id") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.UInt32.PolyML.VAL)
      val getMessageArea_ = call (load_sym libgtk "gtk_statusbar_get_message_area") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val pop_ = call (load_sym libgtk "gtk_statusbar_pop") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val push_ =
        call (load_sym libgtk "gtk_statusbar_push")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.UInt32.PolyML.VAL
          )
      val remove_ =
        call (load_sym libgtk "gtk_statusbar_remove")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val removeAll_ = call (load_sym libgtk "gtk_statusbar_remove_all") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkStatusbarClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStatusbarClass.C.fromPtr false) new_ ()
    fun getContextId self contextDescription = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.UInt32.C.fromVal) getContextId_ (self & contextDescription)
    fun getMessageArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMessageArea_ self
    fun pop self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) pop_ (self & contextId)
    fun push self contextId text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> FFI.UInt32.C.fromVal
      )
        push_
        (
          self
           & contextId
           & text
        )
    fun remove self contextId messageId =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        remove_
        (
          self
           & contextId
           & messageId
        )
    fun removeAll self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) removeAll_ (self & contextId)
    local
      open ClosureMarshal Signal
    in
      fun textPoppedSig f = signal "text-popped" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
      fun textPushedSig f = signal "text-pushed" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
    end
  end
