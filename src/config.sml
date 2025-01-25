(**
 * Interfaces to exclude
 *)

excludedInterfaceTypes := [
  (
    [("GLib", "2.0")],
    [
      "AsciiType",
      "Array",
      "ByteArray",
      "Cond",
      "Data",
      "HashTable",
      "HashTableIter",
      "List",
      "MemVTable",
      "Mutex",
      "OptionEntry",
      "PollFD",
      "PtrArray",
      "Scanner",
      "ScannerConfig",
      "SList",
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
      "EnumValue",
      "EnumClass",
      "FlagsValue",
      "FlagsClass",
      "InterfaceInfo",
      "ObjectConstructParam",
      "Parameter",
      "ParamSpecTypeInfo",
      "ParamSpecPool",
      "TypeClass",
      "TypeFundamentalInfo",
      "TypeInfo",
      "TypeInstance",
      "TypeInterface",
      "TypePluginClass",
      "TypeValueTable"
    ]
  ),
  (
    [("Gio",  "2.0")],
    [
      "OutputVector"
    ]
  ),
  (
    [("GIRepository", "2.0")],
    [
      "AttributeIter"
    ]
  ),
  (
    [("Pango", "1.0")],
    [
      "IncludedModule"
    ]
  ),
  (
    [("PangoCairo", "1.0")],
    [
      "FcFontMap"  (* In Pango 1.40.9, the header for PangoCairoFcFontMap is not visible *)
    ]
  ),
  (
    [("Gtk", "3.0")],
    [
      "AccelGroupEntry",

      (* GObject Introspection seems to ignore a struct field
       * that is a union so would treat GtkBindingArg as a value record. *)
      "BindingArg",

      (* In GTK 3.22, gtk/a11y/gtkstackaccessible.h is not included 
       * by gtk/gtk-a11y.h and does not allow itself to be included
       * directly so field offsets for GtkStackAccessible result in
       * references to GtkStackAccessible which are undefined. *)
      "StackAccessible"
    ]
  )
];

excludedInterfaceTypePrefixes := [
];

excludedInterfaceTypeSuffixes := [
  (
    [],  (* global *)
    [
      "Private"
    ]
  )
];


(**
 * Records (struct types)
 *
 * A record is classified as one of the following:
 *
 *   - value-like
 *   - reference-only
 *   - disguised
 *   - the field of a union
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
 * A union record is the same as the union.
 *
 * These types of record are specified by the constructors
 *
 *   - ValueRecord ...
 *   - Record ...
 *   - DisguisedRecord
 *   - UnionRecord ...
 *
 * The arguments of constructors ValueRecord and Record indicate how the
 * required operations are implemented.  The argument of constructor
 * UnionRecord indicates the parent union interface and its field.
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
 * A union record is specified as
 *
 *   - UnionRecord (parentUnionNamespace, parentUnionName, fieldName)
 *
 *
 * If a record is not mentioned explicitly, a default value is derived as
 * follows: it is classified as `Record Boxed` if the record is a registered
 * type.  Otherwise, it is classified as `ValueRecord Flat` if there is at
 * least one field and none of the fields are references, i.e. C pointers.
 * Otherwise, it is excluded because no duplicate or copy operation is known.
 * Therefore, `DisguisedRecord` and `UnionRecord` are used only when
 * explicitly specified in the configuration.
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
  (
    [("GLib", "2.0")],
    [
      ("IConv",                  DisguisedRecord),
      ("Variant",                Record (NonBoxed {dup = "g_variant_ref_sink", free = "g_variant_unref"}))
    ]
  ),
  (
    [("GObject", "2.0")],
    [
      ("Value",                  ValueRecord (Deep {copy = "giraffe_g_value_copy", clear = "giraffe_g_value_clear"})),
      ("WeakRef",                ValueRecord (Deep {copy = "giraffe_g_weak_ref_copy", clear = "g_weak_ref_clear"}))
    ]
  ),
  (
    [("Gio", "2.0")],
    [
      ("UnixMountEntry",         Record (NonBoxed {dup = "g_unix_mount_copy", free = "g_unix_mount_free"})),
      ("UnixMountPoint",         Record (NonBoxed {dup = "g_unix_mount_point_copy", free = "g_unix_mount_point_free"}))
    ]
  ),
  (
    [("cairo", "1.0")],
    [
      ("FontOptions",            Record (NonBoxed {dup = "cairo_font_options_copy", free = "cairo_font_options_destroy"})),
      ("RectangleInt",           ValueRecord Flat)
    ]
  ),
  (
    [("HarfBuzz", "0.0")],
    [
      ("feature_t",              ValueRecord Flat),
      ("segment_properties_t",   ValueRecord Flat)
    ]
  ),
  (
    [("Pango", "1.0")],
    [
      ("Attribute",              Record (NonBoxed {dup = "pango_attribute_copy", free = "pango_attribute_destroy"}))
    ]
  ),
  (
    [("Atk", "1.0")],
    [
      ("Rectangle",              ValueRecord Flat)
    ]
  ),
  (
    [("Gdk", "3.0")],
    [
      ("Atom",                   DisguisedRecord),
      ("Color",                  ValueRecord Flat),
      ("Rectangle",              ValueRecord Flat),
      ("RGBA",                   ValueRecord Flat),
      ("WindowAttr",             Record (NonBoxed {dup = "giraffe_gdk_window_attr_dup", free = "giraffe_gdk_window_attr_free"})),
      ("EventAny",               UnionRecord ("Gdk", "Event", "any")),
      ("EventButton",            UnionRecord ("Gdk", "Event", "button")),
      ("EventConfigure",         UnionRecord ("Gdk", "Event", "configure")),
      ("EventCrossing",          UnionRecord ("Gdk", "Event", "crossing")),
      ("EventDND",               UnionRecord ("Gdk", "Event", "dnd")),
      ("EventExpose",            UnionRecord ("Gdk", "Event", "expose")),
      ("EventFocus",             UnionRecord ("Gdk", "Event", "focus_change")),
      ("EventGrabBroken",        UnionRecord ("Gdk", "Event", "grab_broken")),
      ("EventKey",               UnionRecord ("Gdk", "Event", "key")),
      ("EventMotion",            UnionRecord ("Gdk", "Event", "motion")),
      ("EventOwnerChange",       UnionRecord ("Gdk", "Event", "owner_change")),
      ("EventPadAxis",           UnionRecord ("Gdk", "Event", "pad_axis")),
      ("EventPadButton",         UnionRecord ("Gdk", "Event", "pad_button")),
      ("EventPadGroupMode",      UnionRecord ("Gdk", "Event", "pad_group_mode")),
      ("EventProperty",          UnionRecord ("Gdk", "Event", "property")),
      ("EventProximity",         UnionRecord ("Gdk", "Event", "proximity")),
      ("EventScroll",            UnionRecord ("Gdk", "Event", "scroll")),
      ("EventSelection",         UnionRecord ("Gdk", "Event", "selection")),
      ("EventSetting",           UnionRecord ("Gdk", "Event", "setting")),
      ("EventTouchpadPinch",     UnionRecord ("Gdk", "Event", "touchpad_pinch")),
      ("EventTouchpadSwipe",     UnionRecord ("Gdk", "Event", "touchpad_swipe")),
      ("EventTouch",             UnionRecord ("Gdk", "Event", "touch")),
      ("EventVisibility",        UnionRecord ("Gdk", "Event", "visibility")),
      ("EventWindowState",       UnionRecord ("Gdk", "Event", "window_state"))
    ]
  ),
  (
    [("Gtk", "3.0")],
    [
      ("Border",                 ValueRecord Flat),
      ("Requisition",            ValueRecord Flat),
      ("TargetEntry",            ValueRecord (Deep {copy = "giraffe_gtk_target_entry_copy", clear = "giraffe_gtk_target_entry_clear"})),
      ("TextIter",               ValueRecord Flat),  (* boxed 'copy', i.e. duplicate, makes a flat copy *)
      ("TreeIter",               ValueRecord Flat)   (* boxed 'copy', i.e. duplicate, makes a flat copy *)
    ]
  )
];


(**
 * Union names to include
 *
 * The codegen design for union interface types is under development and
 * there is only partial codegen support.  As the generated code must be
 * fixed, code is generated for a union interface type only where explicitly
 * requested.
 *)

includedUnionNames := [
  ([("Gdk", "3.0")], ["Event"])
];


(**
 * Fields
 *)

includedClassFieldNames := [
];

excludedFieldNames := [
  (
    [],
    [
      "parent_instance",  (* also avoids issues with incomplete structs in Pango *)
      "priv"
    ]
  )
];

excludedFieldNamePrefixes := [
];

excludedFieldNameSuffixes := [
];

nonOptionalPointerFields := [
  (
    [("GLib", "2.0")],
    [
      ("Error", "message")
    ]
  )
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
      "g_unix_get_passwd_entry",  (* GIR data broken: c:type for return value is missing "struct" keyword.
                                     Not needed as the Basis Library provides `Posix.SysDB.getpwnam`. *)
      "g_variant_type_string_get_depth_",
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
      "g_dbus_error_unregister_error"
    ]
  ),
  (
    [("HarfBuzz", "0.0")],
    [
      "hb_ot_color_glyph_get_layers",
      "hb_ot_layout_feature_get_characters",
      "hb_ot_layout_get_glyphs_in_class",
      "hb_ot_layout_lookup_collect_glyphs",
      "hb_ot_layout_lookup_get_glyph_alternates",
      "hb_ot_layout_lookup_substitute_closure",
      "hb_ot_layout_lookups_substitute_closure",
      "hb_ot_math_get_glyph_assembly",
      "hb_ot_math_get_glyph_variants",
      "hb_ot_meta_get_entry_tags"
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


(**
 * MLton-specific
 *)

(**
 * Default import attributes
 *
 * There are many functions that can invoke callbacks to SML so we specify
 * the import attribute 'reentrant' by default.
 *)
mltonImportAttributesDefault := ["reentrant"];

(**
 * Import attributes
 *
 * There are thousands of functions that could be added here to remove the
 * default 'reentrant' attribute but analyzing a GObject-based library is
 * laborious.  For now, functions are added here as needed.
 *)
mltonImportAttributes := [
  (
    [("GLib", "2.0")],
    [
      ("g_main_context_get_thread_default", []),
      ("g_main_context_ref_thread_default", [])
    ]
  ),
  (
    [("GObject", "2.0")],
    [
      ("g_type_is_a", []),
      ("g_type_name", []),
      ("g_value_copy", []),
      ("g_value_fits_pointer", []),
      ("g_value_init", []),
      ("g_value_type_compatible", []),
      ("g_value_type_transformable", [])
    ]
  )
];
