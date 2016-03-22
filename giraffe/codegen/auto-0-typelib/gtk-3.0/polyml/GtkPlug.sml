structure GtkPlug :>
  GTK_PLUG
    where type 'a class = 'a GtkPlugClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_plug_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_plug_new") (FFI.UInt64.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newForDisplay_ = call (load_sym libgtk "gtk_plug_new_for_display") (GdkDisplayClass.PolyML.cPtr &&> FFI.UInt64.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val construct_ = call (load_sym libgtk "gtk_plug_construct") (GtkPlugClass.PolyML.cPtr &&> FFI.UInt64.PolyML.cVal --> FFI.PolyML.cVoid)
      val constructForDisplay_ =
        call (load_sym libgtk "gtk_plug_construct_for_display")
          (
            GtkPlugClass.PolyML.cPtr
             &&> GdkDisplayClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getEmbedded_ = call (load_sym libgtk "gtk_plug_get_embedded") (GtkPlugClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getId_ = call (load_sym libgtk "gtk_plug_get_id") (GtkPlugClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
      val getSocketWindow_ = call (load_sym libgtk "gtk_plug_get_socket_window") (GtkPlugClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkPlugClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new socketId = (FFI.UInt64.C.withVal ---> GtkPlugClass.C.fromPtr false) new_ socketId
    fun newForDisplay display socketId = (GdkDisplayClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> GtkPlugClass.C.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GtkPlugClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self display socketId =
      (
        GtkPlugClass.C.withPtr
         &&&> GdkDisplayClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GtkPlugClass.C.withPtr ---> FFI.Bool.C.fromVal) getEmbedded_ self
    fun getId self = (GtkPlugClass.C.withPtr ---> FFI.UInt64.C.fromVal) getId_ self
    fun getSocketWindow self = (GtkPlugClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getSocketWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun embeddedSig f = signal "embedded" (void ---> ret_void) f
    end
    local
      open Property
    in
      val embeddedProp = {get = fn x => get "embedded" boolean x}
      val socketWindowProp = {get = fn x => get "socket-window" GdkWindowClass.tOpt x}
    end
  end
