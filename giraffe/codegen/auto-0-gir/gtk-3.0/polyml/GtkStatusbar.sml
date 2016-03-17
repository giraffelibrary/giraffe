structure GtkStatusbar :>
  GTK_STATUSBAR
    where type 'a class = 'a GtkStatusbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_statusbar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_statusbar_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getContextId_ = call (load_sym libgtk "gtk_statusbar_get_context_id") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.UInt.PolyML.cVal)
      val getMessageArea_ = call (load_sym libgtk "gtk_statusbar_get_message_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val pop_ = call (load_sym libgtk "gtk_statusbar_pop") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val push_ =
        call (load_sym libgtk "gtk_statusbar_push")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.UInt.PolyML.cVal
          )
      val remove_ =
        call (load_sym libgtk "gtk_statusbar_remove")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val removeAll_ = call (load_sym libgtk "gtk_statusbar_remove_all") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkStatusbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStatusbarClass.C.fromPtr false) new_ ()
    fun getContextId self contextDescription = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt.C.fromVal) getContextId_ (self & contextDescription)
    fun getMessageArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMessageArea_ self
    fun pop self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) pop_ (self & contextId)
    fun push self contextId text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> Utf8.C.withPtr
         ---> FFI.UInt.C.fromVal
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
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        remove_
        (
          self
           & contextId
           & messageId
        )
    fun removeAll self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeAll_ (self & contextId)
    local
      open ClosureMarshal Signal
    in
      fun textPoppedSig f = signal "text-popped" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
      fun textPushedSig f = signal "text-pushed" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
    end
  end
