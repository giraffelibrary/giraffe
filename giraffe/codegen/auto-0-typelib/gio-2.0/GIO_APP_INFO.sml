signature GIO_APP_INFO =
  sig
    type 'a class
    type app_info_create_flags_t
    type 'a app_launch_context_class
    type 'a icon_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val createFromCommandline :
      string
       * string option
       * app_info_create_flags_t
       -> base class
    val getDefaultForType : string * bool -> base class
    val getDefaultForUriScheme : string -> base class
    val launchDefaultForUri : string * 'a app_launch_context_class option -> bool
    val resetTypeAssociations : string -> unit
    val addSupportsType :
      'a class
       -> string
       -> bool
    val canDelete : 'a class -> bool
    val canRemoveSupportsType : 'a class -> bool
    val delete : 'a class -> bool
    val dup : 'a class -> base class
    val equal :
      'a class
       -> 'b class
       -> bool
    val getCommandline : 'a class -> string
    val getDescription : 'a class -> string
    val getDisplayName : 'a class -> string
    val getExecutable : 'a class -> string
    val getIcon : 'a class -> base icon_class
    val getId : 'a class -> string
    val getName : 'a class -> string
    val removeSupportsType :
      'a class
       -> string
       -> bool
    val setAsDefaultForExtension :
      'a class
       -> string
       -> bool
    val setAsDefaultForType :
      'a class
       -> string
       -> bool
    val setAsLastUsedForType :
      'a class
       -> string
       -> bool
    val shouldShow : 'a class -> bool
    val supportsFiles : 'a class -> bool
    val supportsUris : 'a class -> bool
  end
