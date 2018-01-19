(**
 * GIRepository override
 *)

GIRepository.Override.callableInfoMayReturnNull := [
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

    (* bug 770421 *)
    (("Gtk", SOME "TextIter", "get_attributes", "values"), IN)
  ]
end;

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
  ("GLib", "AsciiType"),
  ("GLib", "Cond"),
  ("GLib", "Data"),
  ("GLib", "MemVTable"),
  ("GLib", "Mutex"),
  ("GLib", "PollFD"),
  ("GLib", "Scanner"),
  ("GLib", "ScannerConfig"),
  ("GLib", "UnicodeScript"),
  ("GLib", "UnicodeBreakType"),
  ("GObject", "CClosure"),
  ("GObject", "ClosureNotifyData"),
  ("GObject", "ConstructParam"),
  ("GObject", "InterfaceInfo"),
  ("GObject", "ParamSpecTypeInfo"),
  ("GObject", "ParamSpecPool"),
  ("GObject", "TypeClass"),
  ("GObject", "TypeFundamentalInfo"),
  ("GObject", "TypeInfo"),
  ("GObject", "TypeInstance"),
  ("GObject", "TypeInterface"),
  ("GObject", "TypePluginClass"),
  ("GObject", "TypeValueTable"),
  ("GObject", "WeakRef"),
  ("Gio",  "OutputVector"),
  ("Pango", "IncludedModule")
];


(**
 * Struct types
 *
 * A struct that is a field of an included union is not in the struct list.
 *)

structTypes := [
  (("GLib", "Bytes"),                 Record {dup = "g_bytes_ref", free = "g_bytes_unref"}),
  (("GLib", "Checksum"),              Record {dup = "g_checksum_copy", free = "g_checksum_free"}),
  (("GLib", "Date"),                  Record {dup = "gdate_copy", free = "g_date_free"}),
  (("GLib", "DateTime"),              Record {dup = "g_date_time_ref", free = "g_date_time_unref"}),
  (("GLib", "DebugKey"),              ValueRecord),
  (("GLib", "Error"),                 Record {dup = "g_error_copy", free = "g_error_free"}),
  (("GLib", "IOChannel"),             Record {dup = "g_io_channel_ref", free = "g_io_channel_unref"}),
  (("GLib", "KeyFile"),               Record {dup = "g_key_file_ref", free = "g_key_file_unref"}),
  (("GLib", "MainContext"),           Record {dup = "g_main_context_ref", free = "g_main_context_unref"}),
  (("GLib", "MarkupParseContext"),    Record {dup = "g_markup_parse_context_ref", free = "g_markup_parse_context_unref"}),
  (("GLib", "MatchInfo"),             Record {dup = "g_match_info_ref", free = "g_match_info_unref"}),
  (("GLib", "OptionEntry"),           ValueRecord),
  (("GLib", "OptionGroup"),           Record {dup = "g_option_group_ref", free = "g_option_group_unref"}),
  (("GLib", "PatternSpec"),           DisguisedRecord),
  (("GLib", "PollFD"),                ValueRecord),
  (("GLib", "Regex"),                 Record {dup = "g_regex_ref", free = "g_regex_unref"}),
  (("GLib", "Source"),                Record {dup = "g_source_ref", free = "g_source_unref"}),
  (("GLib", "String"),                Record {dup = "gstring_copy", free = "gstring_free"}),
  (("GLib", "TestCase"),              DisguisedRecord),
  (("GLib", "TestSuite"),             DisguisedRecord),
  (("GLib", "TimeVal"),               ValueRecord),
  (("GLib", "TimeZone"),              Record {dup = "g_time_zone_ref", free = "g_time_zone_unref"}),
  (("GLib", "Variant"),               Record {dup = "g_variant_ref_sink", free = "g_variant_unref"}),
  (("GLib", "VariantBuilder"),        Record {dup = "g_variant_builder_ref", free = "g_variant_builder_unref"}),
  (("GLib", "VariantDict"),           Record {dup = "g_variant_dict_ref", free = "g_variant_dict_unref"}),
  (("GLib", "VariantType"),           Record {dup = "g_variant_type_copy", free = "g_variant_type_free"}),
  (("GObject", "Closure"),            Record {dup = "g_closure_ref_sink", free = "g_closure_unref"}),
                                      (* g_closure_ref_sink doesn't exist but file replaced by fixed version *)
  (("GObject", "EnumClass"),          ValueRecord),
  (("GObject", "EnumValue"),          ValueRecord),
  (("GObject", "FlagsClass"),         ValueRecord),
  (("GObject", "FlagsValue"),         ValueRecord),
  (("GObject", "Parameter"),          ValueRecord),
  (("GObject",
             "SignalInvocationHint"), ValueRecord),
  (("GObject", "SignalQuery"),        ValueRecord),
  (("GObject", "TypeQuery"),          ValueRecord),
  (("GObject", "Value"),              ValueRecord),
  (("GObject", "ValueArray"),         Record {dup = "g_value_array_copy", free = "g_value_array_free"}),
  (("Gio", "DBusAnnotationInfo"),     Record {dup = "g_dbus_annotation_info_ref", free = "g_dbus_annotation_info_unref"}),
  (("Gio", "DBusArgInfo"),            Record {dup = "g_dbus_arg_info_ref", free = "g_dbus_arg_info_unref"}),
  (("Gio", "DBusInterfaceInfo"),      Record {dup = "g_dbus_interface_info_ref", free = "g_dbus_interface_info_unref"}),
  (("Gio", "DBusMethodInfo"),         Record {dup = "g_dbus_method_info_ref", free = "g_dbus_method_info_unref"}),
  (("Gio", "DBusNodeInfo"),           Record {dup = "g_dbus_node_info_ref", free = "g_dbus_node_info_unref"}),
  (("Gio", "DBusPropertyInfo"),       Record {dup = "g_dbus_property_info_ref", free = "g_dbus_property_info_unref"}),
  (("Gio", "DBusSignalInfo"),         Record {dup = "g_dbus_signal_info_ref", free = "g_dbus_signal_info_unref"}),
  (("Gio", "FileAttributeInfo"),      ValueRecord),
  (("Gio", "FileAttributeInfoList"),  Record {dup = "g_file_attribute_info_list_dup", free = "g_file_attribute_info_list_unref"}),
  (("Gio", "FileAttributeMatcher"),   Record {dup = "g_file_attribute_matcher_ref", free = "g_file_attribute_matcher_unref"}),
  (("Gio", "IOExtension"),            DisguisedRecord),
  (("Gio", "IOExtensionPoint"),       DisguisedRecord),
  (("Gio", "IOModuleScope"),          DisguisedRecord),
  (("Gio", "Resource"),               Record {dup = "g_resource_ref", free = "g_resource_unref"}),
  (("Gio", "SettingsBackend"),        DisguisedRecord),
  (("Gio", "SettingsSchema"),         Record {dup = "g_settings_schema_ref", free = "g_settings_schema_unref"}),
  (("Gio", "SettingsSchemaKey"),      Record {dup = "g_settings_schema_key_ref", free = "g_settings_schema_key_unref"}),
  (("Gio", "SettingsSchemaSource"),   Record {dup = "g_settings_schema_source_ref", free = "g_settings_schema_source_unref"}),
  (("Gio", "SrvTarget"),              Record {dup = "g_srv_target_copy", free = "g_srv_target_free"}),
  (("Gio", "UnixMountEntry"),         Record {dup = "g_unix_mount_copy", free = "g_unix_mount_free"}),
  (("Gio", "UnixMountPoint"),         Record {dup = "g_unix_mount_point_copy", free = "g_unix_mount_point_free"}),
  (("Atk", "Range"),                  Record {dup = "atk_range_copy", free = "atk_range_free"}),
  (("Atk", "Rectangle"),              ValueRecord),
  (("Atk", "TextRange"),              Record {dup = "atk_text_range_copy", free = "atk_text_range_free"}),
  (("Atk", "TextRectangle"),          ValueRecord),
  (("Gdk", "Atom"),                   DisguisedRecord),
  (("Gdk", "EventSequence"),          Record {dup = "gdk_event_sequence_copy", free = "gdk_event_sequence_free"}),
  (("Gdk", "Geometry"),               ValueRecord),
  (("Gdk", "Color"),                  ValueRecord),
  (("Gdk", "FrameTimings"),           Record {dup = "gdk_frame_timings_ref", free = "gdk_frame_timings_unref"}),
  (("Gdk", "KeymapKey"),              ValueRecord),
  (("Gdk", "Point"),                  ValueRecord),
  (("Gdk", "Rectangle"),              ValueRecord),
  (("Gdk", "RGBA"),                   ValueRecord),
  (("Gdk", "WindowAttr"),             Record {dup = "giraffe_gdk_window_attr_dup", free = "giraffe_gdk_window_attr_free"}),
  (("GdkPixbuf", "Pixdata"),          ValueRecord),
  (("GdkPixbuf", "PixbufFormat"),     Record {dup = "gdk_pixbuf_format_copy", free = "gdk_pixbuf_format_free"}),
  (("Gtk", "AccelGroupEntry"),        ValueRecord),
  (("Gtk", "AccelKey"),               ValueRecord),
  (("Gtk", "ActionEntry"),            ValueRecord),
  (("Gtk", "Border"),                 ValueRecord),
  (("Gtk", "CssSection"),             Record {dup = "gtk_css_section_ref", free = "gtk_css_section_unref"}),
  (("Gtk", "FileFilterInfo"),         ValueRecord),
  (("Gtk", "IconInfo"),               Record {dup = "gtk_icon_info_copy", free = "gtk_icon_info_free"}),
  (("Gtk", "IconSet"),                Record {dup = "gtk_icon_set_ref", free = "gtk_icon_set_unref"}),
  (("Gtk", "IconSource"),             Record {dup = "gtk_icon_source_copy", free = "gtk_icon_source_free"}),
  (("Gtk", "PageRange"),              ValueRecord),
  (("Gtk", "PaperSize"),              Record {dup = "gtk_paper_size_copy", free = "gtk_paper_size_free"}),
  (("Gtk", "RecentData"),             ValueRecord),
  (("Gtk", "RecentFilterInfo"),       ValueRecord),
  (("Gtk", "RecentInfo"),             Record {dup = "gtk_recent_info_ref", free = "gtk_recent_info_unref"}),
  (("Gtk", "Requisition"),            ValueRecord),
  (("Gtk", "SelectionData"),          Record {dup = "gtk_selection_data_copy", free = "gtk_selection_data_free"}),
  (("Gtk", "SettingsValue"),          ValueRecord),
  (("Gtk", "StockItem"),              ValueRecord),
  (("Gtk", "SymbolicColor"),          Record {dup = "gtk_symbolic_color_ref", free = "gtk_symbolic_color_unref"}),
  (("Gtk", "TargetEntry"),            ValueRecord),
  (("Gtk", "TargetList"),             Record {dup = "gtk_target_list_ref", free = "gtk_target_list_unref"}),
  (("Gtk", "TextAttributes"),         Record {dup = "gtk_text_attributes_ref", free = "gtk_text_attributes_unref"}),
  (("Gtk", "TextIter"),               ValueRecord),
  (("Gtk", "TreeIter"),               ValueRecord),
  (("Gtk", "TreePath"),               Record {dup = "gtk_tree_path_copy", free = "gtk_tree_path_free"}),
  (("Gtk", "WidgetPath"),             Record {dup = "gtk_widget_path_ref", free = "gtk_widget_path_unref"}),
  (("GtkSource", "Encoding"),         Record {dup = "gtk_source_encoding_copy", free = "gtk_source_encoding_free"}),
  (("GtkSource", "RegionIter"),       ValueRecord),
  (("cairo", "Context"),              Record {dup = "cairo_reference", free = "cairo_destroy"}),
  (("cairo", "FontOptions"),          Record {dup = "cairo_font_options_copy", free = "cairo_font_options_destroy"}),
  (("cairo", "Pattern"),              Record {dup = "cairo_pattern_reference", free = "cairo_pattern_destroy"}),
  (("cairo", "RectangleInt"),         ValueRecord),
  (("cairo", "Region"),               Record {dup = "cairo_region_reference", free = "cairo_region_destroy"}),
  (("cairo", "ScaledFont"),           Record {dup = "cairo_scaled_font_reference", free = "cairo_scaled_font_destroy"}),
  (("cairo", "Surface"),              Record {dup = "cairo_surface_reference", free = "cairo_surface_destroy"}),
  (("Pango", "Analysis"),             ValueRecord),
  (("Pango", "Attribute"),            Record {dup = "pango_attribute_copy", free = "pango_attribute_destroy"}),
  (("Pango", "AttrList"),             Record {dup = "pango_attr_list_ref", free = "pango_attr_list_unref"}),
  (("Pango", "Color"),                Record {dup = "pango_color_copy", free = "pango_color_free"}),
  (("Pango", "FontDescription"),      Record {dup = "pango_font_description_copy", free = "pango_font_description_free"}),
  (("Pango", "FontMetrics"),          Record {dup = "pango_font_metrics_ref", free = "pango_font_metrics_unref"}),
  (("Pango", "GlyphItem"),            Record {dup = "pango_glyph_item_copy", free = "pango_glyph_item_free"}),
  (("Pango", "GlyphString"),          Record {dup = "pango_glyph_string_copy", free = "pango_glyph_string_free"}),
  (("Pango", "Item"),                 Record {dup = "pango_item_copy", free = "pango_item_free"}),
  (("Pango", "Language"),             Record {dup = "pango_language_copy", free = "pango_language_free"}),
  (("Pango", "LayoutIter"),           Record {dup = "pango_layout_iter_copy", free = "pango_layout_iter_free"}),
  (("Pango", "LayoutLine"),           Record {dup = "pango_layout_line_ref", free = "pango_layout_line_unref"}),
  (("Pango", "LogAttr"),              ValueRecord),
  (("Pango", "Matrix"),               Record {dup = "pango_matrix_copy", free = "pango_matrix_free"}),
  (("Pango", "Rectangle"),            ValueRecord),
  (("Pango", "TabArray"),             Record {dup = "pango_tab_array_copy", free = "pango_tab_array_free"}),
  (("Vte", "Regex"),                  Record {dup = "vte_regex_ref", free = "vte_regex_unref"})
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
