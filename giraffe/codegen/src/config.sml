(**
 * GIRepository override
 *)

GIRepository.Override.callableInfoMayReturnNull := [
  (* https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1418 *)
  (("Gio", SOME "InetAddress", "new_from_string"), true),
  (("Gio", SOME "InetSocketAddress", "new_from_string"), true),

  (("Gtk", SOME "FileChooser", "get_filename"), true),
  (("Gtk", SOME "FileChooser", "get_current_folder"), true),
  (("Gtk", SOME "FileChooser", "get_uri"), true),
  (("Gtk", SOME "FileChooser", "get_current_folder_uri"), true),
  (("Gtk", SOME "FileChooser", "get_preview_widget"), true),
  (("Gtk", SOME "FileChooser", "get_preview_filename"), true),
  (("Gtk", SOME "FileChooser", "get_preview_uri"), true),
  (("Gtk", SOME "FileChooser", "get_extra_widget"), true),
  (("Gtk", SOME "FileChooser", "get_filter"), true),
  (("Gtk", SOME "FileChooser", "get_preview_file"), true),
  (("Gtk", SOME "Paned", "get_child1"), true),
  (("Gtk", SOME "Paned", "get_child2"), true),
  (("Gtk", SOME "Container", "get_focus_child"), true)
];

GIRepository.Override.argInfoMayBeNull := [
  (("GLib", SOME "Source", "attach", "context"), true),
  (("Gtk", SOME "Container", "set-focus-child", "object"), true)
];

let
  open GIRepository.Direction
in
  GIRepository.Override.argInfoDirection := [
    (* bug 783392 *)
    (("Gio", SOME "DBusInterfaceInfo", "generate_xml", "string_builder"), IN),
    (("Gio", SOME "DBusNodeInfo", "generate_xml", "string_builder"), IN),

    (* https://gitlab.gnome.org/GNOME/glib/-/issues/1258 *)
    (("Gio", SOME "InputStream", "read", "buffer"), OUT),
    (("Gio", SOME "InputStream", "read_async", "buffer"), OUT),
    (("Gio", SOME "InputStream", "read_all", "buffer"), OUT),
    (("Gio", SOME "InputStream", "read_all_async", "buffer"), OUT),

    (* https://gitlab.gnome.org/GNOME/glib/-/issues/2176 *)
    (("Gio", SOME "Socket", "receive", "buffer"), OUT),
    (("Gio", SOME "Socket", "receive_from", "buffer"), OUT),
    (("Gio", SOME "Socket", "receive_with_blocking", "buffer"), OUT),

    (* bug 770421 *)
    (("Gtk", SOME "TextIter", "get_attributes", "values"), IN)
  ]
end;

GIRepository.Override.argInfoCallerAllocates := [
  (* https://gitlab.gnome.org/GNOME/glib/-/issues/1258 *)
  (("Gio", SOME "InputStream", "read", "buffer"), true),
  (("Gio", SOME "InputStream", "read_async", "buffer"), true),
  (("Gio", SOME "InputStream", "read_all", "buffer"), true),
  (("Gio", SOME "InputStream", "read_all_async", "buffer"), true),

  (* https://gitlab.gnome.org/GNOME/glib/-/issues/2176 *)
  (("Gio", SOME "Socket", "receive", "buffer"), true),
  (("Gio", SOME "Socket", "receive_from", "buffer"), true),
  (("Gio", SOME "Socket", "receive_with_blocking", "buffer"), true)
];

let
  open GIRepository.Transfer
in
  GIRepository.Override.callableInfoCallerOwns := [
    (("Vte", SOME "Terminal", "new"), NOTHING)
  ]
end;


(**
 * Interfaces to exclude
 *)

excludedInterfaceTypes := [
  (
    [("GLib", "2.0")],
    [
      "AsciiType",
      "Cond",
      "Data",
      "MemVTable",
      "Mutex",
      "PollFD",
      "Scanner",
      "ScannerConfig",
      "UnicodeScript",
      "UnicodeBreakType"
    ]
  ),
  (
    [("GObject", "2.0")],
    [
      "CClosure",
      "ClosureNotifyData",
      "ConstructParam",
      "InterfaceInfo",
      "ParamSpecTypeInfo",
      "ParamSpecPool",
      "TypeClass",
      "TypeFundamentalInfo",
      "TypeInfo",
      "TypeInstance",
      "TypeInterface",
      "TypePluginClass",
      "TypeValueTable",
      "WeakRef"
    ]
  ),
  (
    [("Gio",  "2.0")],
    [
      "OutputVector"
    ]
  ),
  (
    [("Pango", "1.0")],
    [
      "IncludedModule"
    ]
  )
];


(**
 * Records (struct types)
 *
 * A record that is a field of an included union is not included this list.
 *
 * A record is classified as one of the following:
 *
 *   - value-like
 *   - reference-only
 *   - disguised
 *
 * A value-like record is one whose size is known and has a copy operation
 * (that copies from one area of memory to another, as opposed to a duplicate
 * operation that allocates a new instance).  If any fields are references,
 * the copy operation is deep and it also has a clear operation.  A value-
 * like record can be referenced and used like a reference.
 *
 * A reference-only record does not have a known size or cannot be copied but
 * has duplicate and free operations (which increment and decrement,
 * respectively, the reference count if the record is reference counted).
 *
 * An disguised record is one that is just a pointer internally.
 *
 * These types of record are specified by the constructors
 *
 *   - ValueRecord ...
 *   - Record ...
 *   - DisguisedRecord
 *
 * The constructor arguments indicate how the required operations are
 * implemented.
 *
 * A value-like record without any fields that are references can be copied
 * using memcpy but if any fields are references, bespoke copy and clear
 * functions are required.  These two cases of a value-like record are
 * specified as
 *
 *   - ValueRecord Flat
 *   - ValueRecord (Deep {copy = "<copy_sym>", clear = "<clear_sym>"})
 *
 * A reference-only record that is registered as a boxed type can be
 * duplicated and freed using g_boxed_copy and g_boxed_free, respectively,
 * but otherwise bespoke duplicate and free functions are required.  These
 * two cases of a reference-only record are specified as
 *
 *   - Record Boxed
 *   - Record (NonBoxed {dup = "<dup_sym>", free = "<free_sym>"})
 *
 * A disguised record is specified as
 *
 *   - DisguisedRecord
 *
 *
 * Notes
 *
 *   - A record that is reference counted must be reference-only.
 *
 *   - The elements of a value-like record array may be values (packed
 *     inline) or references but the elements of a reference-only record
 *     array can only be references.
 *)

structTypes := [
  (("GLib", "Bytes"),                 Record Boxed),
  (("GLib", "Checksum"),              Record Boxed),
  (("GLib", "Date"),                  Record Boxed),
  (("GLib", "DateTime"),              Record Boxed),
  (("GLib", "DebugKey"),              ValueRecord Flat),
  (("GLib", "Error"),                 Record Boxed),
  (("GLib", "IOChannel"),             Record Boxed),
  (("GLib", "KeyFile"),               Record Boxed),
  (("GLib", "MainContext"),           Record Boxed),
  (("GLib", "MarkupParseContext"),    Record Boxed),
  (("GLib", "MatchInfo"),             Record Boxed),
  (("GLib", "OptionEntry"),           ValueRecord Flat),
  (("GLib", "OptionGroup"),           Record Boxed),
  (("GLib", "PatternSpec"),           DisguisedRecord),
  (("GLib", "PollFD"),                ValueRecord Flat),
  (("GLib", "Regex"),                 Record Boxed),
  (("GLib", "Source"),                Record Boxed),
  (("GLib", "String"),                Record Boxed),
  (("GLib", "TestCase"),              DisguisedRecord),
  (("GLib", "TestSuite"),             DisguisedRecord),
  (("GLib", "TimeVal"),               ValueRecord Flat),
  (("GLib", "TimeZone"),              Record Boxed),
  (("GLib", "Variant"),               Record (NonBoxed {dup = "g_variant_ref_sink", free = "g_variant_unref"})),
  (("GLib", "VariantBuilder"),        Record Boxed),
  (("GLib", "VariantDict"),           Record Boxed),
  (("GLib", "VariantType"),           Record Boxed),
  (("GObject", "Closure"),            Record Boxed),  (* fixed source uses 'g_closure_ref' then 'g_closure_sink' for dup *)
  (("GObject", "EnumClass"),          ValueRecord Flat),
  (("GObject", "EnumValue"),          ValueRecord Flat),
  (("GObject", "FlagsClass"),         ValueRecord Flat),
  (("GObject", "FlagsValue"),         ValueRecord Flat),
  (("GObject",
             "SignalInvocationHint"), ValueRecord Flat),
  (("GObject", "SignalQuery"),        ValueRecord Flat),
  (("GObject", "TypeQuery"),          ValueRecord Flat),
  (("GObject", "Value"),              ValueRecord (Deep {copy = "giraffe_g_value_copy", clear = "giraffe_g_value_clear"})),
  (("GObject", "ValueArray"),         Record Boxed),
  (("Gio", "DBusAnnotationInfo"),     Record Boxed),
  (("Gio", "DBusArgInfo"),            Record Boxed),
  (("Gio", "DBusInterfaceInfo"),      Record Boxed),
  (("Gio", "DBusMethodInfo"),         Record Boxed),
  (("Gio", "DBusNodeInfo"),           Record Boxed),
  (("Gio", "DBusPropertyInfo"),       Record Boxed),
  (("Gio", "DBusSignalInfo"),         Record Boxed),
  (("Gio", "FileAttributeInfo"),      ValueRecord Flat),
  (("Gio", "FileAttributeInfoList"),  Record Boxed),
  (("Gio", "FileAttributeMatcher"),   Record Boxed),
  (("Gio", "IOExtension"),            DisguisedRecord),
  (("Gio", "IOExtensionPoint"),       DisguisedRecord),
  (("Gio", "IOModuleScope"),          DisguisedRecord),
  (("Gio", "Resource"),               Record Boxed),
  (("Gio", "SettingsBackend"),        DisguisedRecord),
  (("Gio", "SettingsSchema"),         Record Boxed),
  (("Gio", "SettingsSchemaKey"),      Record Boxed),
  (("Gio", "SettingsSchemaSource"),   Record Boxed),
  (("Gio", "SrvTarget"),              Record Boxed),
  (("Gio", "UnixMountEntry"),         Record (NonBoxed {dup = "g_unix_mount_copy", free = "g_unix_mount_free"})),
  (("Gio", "UnixMountPoint"),         Record (NonBoxed {dup = "g_unix_mount_point_copy", free = "g_unix_mount_point_free"})),
  (("Atk", "Range"),                  Record Boxed),
  (("Atk", "Rectangle"),              ValueRecord Flat),
  (("Atk", "TextRange"),              Record Boxed),
  (("Atk", "TextRectangle"),          ValueRecord Flat),
  (("Gdk", "Atom"),                   DisguisedRecord),
  (("Gdk", "EventSequence"),          Record Boxed),
  (("Gdk", "Geometry"),               ValueRecord Flat),
  (("Gdk", "Color"),                  ValueRecord Flat),
  (("Gdk", "FrameTimings"),           Record Boxed),
  (("Gdk", "KeymapKey"),              ValueRecord Flat),
  (("Gdk", "Point"),                  ValueRecord Flat),
  (("Gdk", "Rectangle"),              ValueRecord Flat),
  (("Gdk", "RGBA"),                   ValueRecord Flat),
  (("Gdk", "WindowAttr"),             Record (NonBoxed {dup = "giraffe_gdk_window_attr_dup", free = "giraffe_gdk_window_attr_free"})),
  (("GdkPixbuf", "Pixdata"),          ValueRecord Flat),
  (("GdkPixbuf", "PixbufFormat"),     Record Boxed),
  (("Gtk", "AccelGroupEntry"),        ValueRecord Flat),
  (("Gtk", "AccelKey"),               ValueRecord Flat),
  (("Gtk", "ActionEntry"),            ValueRecord Flat),
  (("Gtk", "Border"),                 ValueRecord Flat),  (* overrides default *)
  (("Gtk", "CssSection"),             Record Boxed),
  (("Gtk", "FileFilterInfo"),         ValueRecord Flat),
  (("Gtk", "IconSet"),                Record Boxed),
  (("Gtk", "IconSource"),             Record Boxed),
  (("Gtk", "PageRange"),              ValueRecord Flat),
  (("Gtk", "PaperSize"),              Record Boxed),
  (("Gtk", "RecentData"),             ValueRecord Flat),
  (("Gtk", "RecentFilterInfo"),       ValueRecord Flat),
  (("Gtk", "RecentInfo"),             Record Boxed),
  (("Gtk", "Requisition"),            ValueRecord Flat),  (* overrides default *)
  (("Gtk", "SelectionData"),          Record Boxed),
  (("Gtk", "SettingsValue"),          ValueRecord Flat),
  (("Gtk", "StockItem"),              ValueRecord Flat),
  (("Gtk", "SymbolicColor"),          Record Boxed),
  (("Gtk", "TargetEntry"),            ValueRecord (Deep {copy = "giraffe_gtk_target_entry_copy", clear = "giraffe_gtk_target_entry_clear"})),
  (("Gtk", "TargetList"),             Record Boxed),
  (("Gtk", "TextAttributes"),         Record Boxed),
  (("Gtk", "TextIter"),               ValueRecord Flat),  (* overrides default *)
  (("Gtk", "TreeIter"),               ValueRecord Flat),  (* overrides default *)
  (("Gtk", "TreePath"),               Record Boxed),
  (("Gtk", "WidgetPath"),             Record Boxed),
  (("GtkSource", "Encoding"),         Record Boxed),
  (("GtkSource", "RegionIter"),       ValueRecord Flat),
  (("cairo", "Context"),              Record Boxed),
  (("cairo", "FontOptions"),          Record (NonBoxed {dup = "cairo_font_options_copy", free = "cairo_font_options_destroy"})),
  (("cairo", "Pattern"),              Record Boxed),
  (("cairo", "RectangleInt"),         ValueRecord Flat),
  (("cairo", "Region"),               Record Boxed),
  (("cairo", "ScaledFont"),           Record Boxed),
  (("cairo", "Surface"),              Record Boxed),
  (("Pango", "Analysis"),             ValueRecord Flat),
  (("Pango", "Attribute"),            Record (NonBoxed {dup = "pango_attribute_copy", free = "pango_attribute_destroy"})),
  (("Pango", "AttrList"),             Record Boxed),
  (("Pango", "Color"),                Record Boxed),
  (("Pango", "FontDescription"),      Record Boxed),
  (("Pango", "FontMetrics"),          Record Boxed),
  (("Pango", "GlyphItem"),            Record Boxed),
  (("Pango", "GlyphString"),          Record Boxed),
  (("Pango", "Item"),                 Record Boxed),
  (("Pango", "Language"),             Record Boxed),
  (("Pango", "LayoutIter"),           Record Boxed),
  (("Pango", "LayoutLine"),           Record Boxed),
  (("Pango", "LogAttr"),              ValueRecord Flat),
  (("Pango", "Matrix"),               Record Boxed),
  (("Pango", "Rectangle"),            ValueRecord Flat),
  (("Pango", "TabArray"),             Record Boxed),
  (("Vte", "Regex"),                  Record Boxed)
];


(**
 * Union names to include
 *)

unionNames := [
  ("Gdk", "Event")
];


(**
 * Constant names to exclude
 *)

excludedConstantNames := [
  (
    [("GLib", "2.0")],
    [
      "ASCII_DTOSTR_BUF_SIZE",
      "ATOMIC_OP_USE_GCC_BUILTINS",
      "CAN_INLINE",
      "DATALIST_FLAGS_MASK",
      "E",
      "HAVE_GINT64",
      "HAVE_GROWING_STACK",
      "HAVE_INLINE",
      "HAVE_ISO_VARARGS",
      "HAVE___INLINE",
      "HAVE___INLINE__",
      "HOOK_FLAG_USER_SHIFT",
      "LN10",
      "LN2",
      "LOG_2_BASE_10",
      "LOG_DOMAIN",
      "LOG_FATAL_MASK",
      "MODULE_SUFFIX",
      "MUTEX_DEBUG_MAGIC",
      "OPTION_REMAINING",
      "PI",
      "PI_2",
      "PI_4",
      "SQRT2",
      "STR_DELIMITERS",
      "USEC_PER_SEC",
      "VA_COPY_AS_ARRAY",
      "WIN32_MSG_HANDLE"
    ]
  )
];

excludedConstantNamePrefixes := [
  (
    [("GLib", "2.0")],
    [
      "ALLOCATOR_",
      "ALLOC_",
      "CSET_",
      "DATE_BAD_",
      "GNUC_",
      "HAVE_GNUC_",
      "IEEE754_",
      "SIZEOF_",
      "SYSDEF_"
    ]
  )
];

excludedConstantNameSuffixes := [
  (
    [("GLib", "2.0")],
    [
      "_ENDIAN",
      "_FORMAT",
      "_MODIFIER",
      "_SEPARATOR",
      "_SEPARATOR_S"
    ]
  )
];


(**
 * Function names to exclude
 *)

(* Manually specified symbols
 *
 * Notes
 *
 *   1. Parameter selection_data is annotated with (out) but should probably
 *      be (inout).  (out) requires `withNewPtr` which cannot be implemented
 *      because size of GtkSelectionData is not known by C compiler.
 *
 *)
excludedFunctionSymbols := [
  (
    [("GLib", "2.0")],
    [
      "g_access",
      "g_bit_nth_lsf",
      "g_bit_nth_msf",
      "g_bit_storage",
      "g_blow_chunks",
      "g_basename",
      "g_clear_error",
      "g_file_error_from_errno",
      "g_file_open_tmp",
      "g_file_read_link",
      "g_file_get_contents",
      "g_file_set_contents",
      "g_file_test",
      "g_intern_static_string",
      "g_intern_string",
      "g_get_charset",  (* GIR data broken: says param 0 is utf8 *)
      "g_get_filename_charsets",  (* GIR data broken: says param 0 is utf8 *)
      "g_error_matches",
      "g_mem_is_system_malloc",
      "g_mem_set_vtable",
      "g_mem_profile",
      "g_quark_from_static_string",
      "g_quark_from_string",
      "g_quark_to_string",
      "g_quark_try_string",
      "g_regex_escape_string",  (* GIR data broken: says param 0 is utf8 array *)
      "g_return_if_fail_warning",
      "g_source_new",
      "g_source_set_callback_indirect",
      "g_source_add_poll",
      "g_source_remove_poll",
      "g_source_set_funcs",
      "g_source_remove_by_funcs_user_data",
      "g_source_remove_by_user_data",
      "g_spaced_primes_closest",
      "g_stpcpy",
      "glib_dummy_decl"
    ]
  ),
  (
    [("GObject", "2.0")],
    [
      "g_closure_new_simple",
      "g_closure_new_object",
      "g_object_interface_find_property",
      "g_object_interface_install_property",
      "g_object_interface_list_properties",
      "g_object_is_floating",
      "g_object_force_floating",
      "g_param_spec_pool_new",
      "g_param_value_convert",
      "g_param_value_defaults",
      "g_param_value_set_default",
      "g_param_value_validate",
      "g_param_values_cmp",
      "g_signal_accumulator_first_wins",
      "g_signal_accumulator_true_handled",
      "g_signal_chain_from_overridden",
      "g_signal_get_invocation_hint",
      "g_signal_has_handler_pending",
      "g_signal_name",
      "g_signal_query",
      "g_signal_remove_emission_hook",
      "g_signal_stop_emission",
      "g_signal_stop_emission_by_name",
      "g_source_set_closure",
      "g_source_set_dummy_callback",
      "g_strdup_value_contents",
      "g_type_check_instance",
      "g_type_check_value",
      "g_type_class_add_private",
      "g_type_default_interface_unref",
      "g_type_free_instance",
      "g_type_name_from_class",
      "g_type_name_from_instance"
    ]
  ),
  (
    [("Gio", "2.0")],
    [
      (* g_application_add_main_option_entries requires a null value for
       * struct GOptionEntry to terminate an array of GOptionEntry structs.
       * GLibOptionEntryRecord.C.ValueType implements C_VALUE_TYPE, not
       * C_VALUE_NULL_TYPE, so there is no null value for the struct.
       * The C function checks for a null GOptionEntry value by checking for
       * entries[i].long_name == NULL because long_name is the first field in
       * the struct.  g_application_add_main_option should be used instead. *)
      "g_application_add_main_option_entries",
      "g_dbus_error_register_error",
      "g_dbus_error_unregister_error",
      "g_settings_backend_changed_tree",
      "g_settings_backend_flatten_tree"
    ]
  ),
  (
    [("Pango", "1.0")],
    [
      "pango_break",
      "pango_default_break",
      "pango_font_descriptions_free",
      "pango_font_find_shaper",
      "pango_get_log_attrs",
      "pango_glyph_item_letter_space",
      "pango_shape",
      "pango_read_line",
      "pango_skip_space",
      "pango_scan_int",
      "pango_scan_string",
      "pango_scan_word",
      "pango_attribute_init",
      "pango_attribute_destroy"
    ]
  ),
  (
    [("GdkPixbuf", "2.0")],
    [
      "gdk_pixbuf_error_quark"
    ]
  ),
  (
    [("Gdk", "3.0")],
    [
      "gdk_add_option_entries_libgtk_only"
    ]
  ),
  (
    [("Gtk", "3.0")],
    [
      "gtk_accel_map_load_scanner",
      "gtk_binding_entry_add_signal_from_string",
      "gtk_binding_entry_remove",
      "gtk_binding_set_find",
      "gtk_bindings_activate",
      "gtk_bindings_activate_event",
      "gtk_binding_entry_skip",
      "gtk_buildable_custom_tag_start",
      "gtk_distribute_natural_allocation",
      (* gtk_init_with_args requires a null value for struct GOptionEntry to
       * terminate an array of GOptionEntry structs.
       * GLibOptionEntryRecord.C.ValueType implements C_VALUE_TYPE, not
       * C_VALUE_NULL_TYPE, so there is no null value for the struct.
       * See also g_application_add_main_option_entries. *)
      "gtk_init_with_args",
      "gtk_rc_parse_color",  (* deprecated anyway? *)
      "gtk_rc_parse_color_full",  (* deprecated anyway? *)
      "gtk_rc_property_parse_color",
      "gtk_rc_property_parse_border",
      "gtk_rc_property_parse_enum",
      "gtk_rc_property_parse_flags",
      "gtk_rc_property_parse_requisition",
      "gtk_tree_drag_source_drag_data_get",  (* see note 1 *)
      "gtk_widget_destroyed"
    ]
  ),
  (
    [("Vte", "2.90"), ("Vte", "2.91")],
    [
      "vte_pty_error_quark"
    ]
  )
];

excludedFunctionSymbolPrefixes := [
  (
    [("GLib", "2.0")],
    [
      "g_ascii",
      "g_str",
      "g_utf8",
      "g_unichar"
    ]
  ),
  (
    [("GObject", "2.0")],
    [
      "g_cclosure_marshal",
      "g_signal_connect",
      "g_signal_handler"
    ]
  )
];

excludedFunctionSymbolSuffixes := [
  (
    [("GLib", "2.0")],
    [
      "error_quark"
    ]
  )
];

(* Systematically formed names that do not belong in the user API *)
nonUserFunctionNames := [
  "ref",
  "ref_sink",
  "sink",
  "unref",
  "free",
  "false",
  "true",
  "quark",
  "error_quark"
];


(**
 * Flag/enum value names to transform
 *)

newFlagsEnumValueNames := [
  ("2big", "too_big"),
  ("2button_press", "double_button_press"),
  ("3button_press", "triple_button_press")
];
