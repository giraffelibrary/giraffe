signature GTK_PRINT_OPERATION_PREVIEW =
  sig
    type 'a class
    type 'a page_setup_class
    type 'a print_context_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val endPreview : 'a class -> unit
    val isSelected :
      'a class
       -> LargeInt.int
       -> bool
    val renderPage :
      'a class
       -> LargeInt.int
       -> unit
    val gotPageSizeSig :
      (base print_context_class
        -> base page_setup_class
        -> unit)
       -> 'a class Signal.signal
    val readySig : (base print_context_class -> unit) -> 'a class Signal.signal
  end
