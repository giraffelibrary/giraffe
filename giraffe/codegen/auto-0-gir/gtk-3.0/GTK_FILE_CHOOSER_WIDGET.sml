signature GTK_FILE_CHOOSER_WIDGET =
  sig
    type 'a class
    type 'a buildable_class
    type 'a file_chooser_class
    type 'a orientable_class
    type file_chooser_action_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asFileChooser : 'a class -> base file_chooser_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : file_chooser_action_t -> base class
    val desktopFolderSig : (unit -> unit) -> 'a class Signal.t
    val downFolderSig : (unit -> unit) -> 'a class Signal.t
    val homeFolderSig : (unit -> unit) -> 'a class Signal.t
    val locationPopupSig : (string -> unit) -> 'a class Signal.t
    val locationPopupOnPasteSig : (unit -> unit) -> 'a class Signal.t
    val locationTogglePopupSig : (unit -> unit) -> 'a class Signal.t
    val placesShortcutSig : (unit -> unit) -> 'a class Signal.t
    val quickBookmarkSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val recentShortcutSig : (unit -> unit) -> 'a class Signal.t
    val searchShortcutSig : (unit -> unit) -> 'a class Signal.t
    val showHiddenSig : (unit -> unit) -> 'a class Signal.t
    val upFolderSig : (unit -> unit) -> 'a class Signal.t
    val searchModeProp : ('a class, bool, bool) Property.readwrite
    val subtitleProp : ('a class, string option) Property.readonly
  end
