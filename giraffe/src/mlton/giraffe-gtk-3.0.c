/* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gtk C interface support for MLton
 */

#include <gtk/gtk.h>

#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"


/* GtkAccelKey */

GtkAccelKey *
giraffe_gtk_accel_key_new (void)
{
  return g_slice_new (GtkAccelKey);
}

GtkAccelKey *
giraffe_gtk_accel_key_copy (const GtkAccelKey *key)
{
  return g_slice_dup (GtkAccelKey, key);
}

void
giraffe_gtk_accel_key_free (GtkAccelKey *key)
{
  g_slice_free (GtkAccelKey, key);
}


/* GtkAction */

GtkAction *
mlton_gtk_action_new (SML_CVECTOR_VAL(gchar, name),
                      SML_CVECTOR_VAL(gchar, label),
                      SML_CVECTOR_VAL(gchar, tooltip),
                      SML_CVECTOR_VAL(gchar, stock_id))
{
  return gtk_action_new (GET_SML_CVECTOR_VAL(gchar, name),
                         GET_SML_CVECTOR_VAL(gchar, label),
                         GET_SML_CVECTOR_VAL(gchar, tooltip),
                         GET_SML_CVECTOR_VAL(gchar, stock_id));
}


/* GtkActionGroup */

GtkActionGroup *
mlton_gtk_action_group_new (SML_CVECTOR_VAL(gchar, name))
{
  return gtk_action_group_new (GET_SML_CVECTOR_VAL(gchar, name));
}

void
mlton_gtk_action_group_add_action_with_accel (GtkActionGroup *action_group,
                                              GtkAction *action,
                                              SML_CVECTOR_VAL(gchar, accelerator))
{
  gtk_action_group_add_action_with_accel (action_group,
                                          action,
                                          GET_SML_CVECTOR_VAL(gchar, accelerator));
}

GtkAction *
mlton_gtk_action_group_get_action (GtkActionGroup *action_group,
                                   SML_CVECTOR_VAL(gchar, action_name))
{
  return gtk_action_group_get_action (action_group, GET_SML_CVECTOR_VAL(gchar, action_name));
}


/* GtkButton */

GtkWidget *
mlton_gtk_button_new_with_label (SML_CVECTOR_VAL(gchar, label))
{
  return gtk_button_new_with_label (GET_SML_CVECTOR_VAL(gchar, label));
}

GtkWidget *
mlton_gtk_button_new_with_mnemonic (SML_CVECTOR_VAL(gchar, label))
{
  return gtk_button_new_with_mnemonic (GET_SML_CVECTOR_VAL(gchar, label));
}

GtkWidget *
mlton_gtk_button_new_from_stock (SML_CVECTOR_VAL(gchar, stock_id))
{
  return gtk_button_new_from_stock (GET_SML_CVECTOR_VAL(gchar, stock_id));
}


/* GtkDialog */

GtkWidget *
mlton_gtk_dialog_add_button (GtkDialog *dialog,
                             SML_CVECTOR_VAL(gchar, button_text),
                             gint response_id)
{
  return gtk_dialog_add_button (dialog,
                                GET_SML_CVECTOR_VAL(gchar, button_text),
                                response_id);
}


/* GtkEntry */

void
mlton_gtk_entry_set_text (GtkEntry *entry,
                          SML_CVECTOR_VAL(gchar, text))
{
  gtk_entry_set_text (entry,
                      GET_SML_CVECTOR_VAL(gchar, text));
}


/* GtkFileChooser */

void
mlton_gtk_file_chooser_set_current_name (GtkFileChooser *chooser,
                                         SML_CVECTOR_VAL(gchar, name))
{
  gtk_file_chooser_set_current_name (chooser,
                                     GET_SML_CVECTOR_VAL(gchar, name));
}


gboolean
mlton_gtk_file_chooser_set_filename (GtkFileChooser *chooser,
                                     SML_CVECTOR_VAL(gchar, filename))
{
  return gtk_file_chooser_set_filename (chooser,
                                        GET_SML_CVECTOR_VAL(gchar, filename));
}

gboolean
mlton_gtk_file_chooser_set_current_folder (GtkFileChooser *chooser,
                                           SML_CVECTOR_VAL(gchar, filename))
{
  return gtk_file_chooser_set_current_folder (chooser,
                                              GET_SML_CVECTOR_VAL(gchar, filename));
}


/* GtkFileChooserDialog */

GtkWidget *
giraffe_gtk_file_chooser_dialog_new (SML_CVECTOR_VAL(gchar, title),
                                     GtkWindow *parent,
                                     GtkFileChooserAction action)
{
  return gtk_file_chooser_dialog_new (GET_SML_CVECTOR_VAL(gchar, title),
                                      parent,
                                      action,
                                      NULL,
                                      NULL);
}


/* GtkFileFilter */

GtkFileFilterInfo *
giraffe_gtk_file_filter_info_new (void)
{
  return g_slice_new (GtkFileFilterInfo);
}

GtkFileFilterInfo *
giraffe_gtk_file_filter_info_copy (const GtkFileFilterInfo *info)
{
  return g_slice_dup (GtkFileFilterInfo, info);
}

void
giraffe_gtk_file_filter_info_free (GtkFileFilterInfo *info)
{
  g_slice_free (GtkFileFilterInfo, info);
}


/* GtkLabel */

GtkWidget *
mlton_gtk_label_new (SML_CVECTOR_VAL(gchar, str))
{
  return gtk_label_new (GET_SML_CVECTOR_VAL(gchar, str));
}

void
mlton_gtk_label_set_text (GtkLabel *label,
                          SML_CVECTOR_VAL(gchar, str))
{
  gtk_label_set_text (label,
                      GET_SML_CVECTOR_VAL(gchar, str));
}


/* GtkMessageDialog */

GtkWidget *
giraffe_gtk_message_dialog_new (GtkWindow *parent,
                                GtkDialogFlags flags,
                                GtkMessageType type,
                                GtkButtonsType buttons)
{
  return gtk_message_dialog_new (parent,
                                 flags,
                                 type,
                                 buttons,
                                 NULL);
}


/* GtkRecentFilter */

GtkRecentFilterInfo *
giraffe_gtk_recent_filter_info_new (void)
{
  return g_slice_new (GtkRecentFilterInfo);
}

GtkRecentFilterInfo *
giraffe_gtk_recent_filter_info_copy (const GtkRecentFilterInfo *info)
{
  return g_slice_dup (GtkRecentFilterInfo, info);
}

void
giraffe_gtk_recent_filter_info_free (GtkRecentFilterInfo *info)
{
  g_slice_free (GtkRecentFilterInfo, info);
}


/* GtkRecentData */

GtkRecentData *
giraffe_gtk_recent_data_new (void)
{
  return g_slice_new (GtkRecentData);
}

GtkRecentData *
giraffe_gtk_recent_data_copy (const GtkRecentData *data)
{
  return g_slice_dup (GtkRecentData, data);
}

void
giraffe_gtk_recent_data_free (GtkRecentData *data)
{
  g_slice_free (GtkRecentData, data);
}


/* GtkSettingsValue */

GtkSettingsValue *
giraffe_gtk_settings_value_new (void)
{
  return g_slice_new (GtkSettingsValue);
}

GtkSettingsValue *
giraffe_gtk_settings_value_copy (const GtkSettingsValue *settings_value)
{
  return g_slice_dup (GtkSettingsValue, settings_value);
}

void
giraffe_gtk_settings_value_free (GtkSettingsValue *settings_value)
{
  g_slice_free (GtkSettingsValue, settings_value);
}


/* GtkStockItem */

GtkStockItem *
giraffe_gtk_stock_item_new (void)
{
  return g_new (GtkStockItem, 1);
}


/* GtkTextBuffer */

void
mlton_gtk_text_buffer_set_text (GtkTextBuffer *buffer,
                                SML_CVECTOR_VAL(gchar, text),
                                gint len)
{
  gtk_text_buffer_set_text (buffer,
                            GET_SML_CVECTOR_VAL(gchar, text),
                            len);
}


void
mlton_gtk_text_buffer_insert (GtkTextBuffer *buffer,
                              GtkTextIter *iter,
                              SML_CVECTOR_VAL(gchar, text),
                              gint len)
{
  gtk_text_buffer_insert (buffer, iter, GET_SML_CVECTOR_VAL(gchar, text), len);
}


/* GtkTextTag */

GtkTextTag *
mlton_gtk_text_tag_new (SML_CVECTOR_VAL(gchar, name))
{
  return gtk_text_tag_new (GET_SML_CVECTOR_VAL(gchar, name));
}


/* GtkTextIter */

GtkTextIter *
giraffe_gtk_text_iter_new (void)
{
  return g_slice_new (GtkTextIter);
}


/* GtkTreeIter */

GtkTreeIter *
giraffe_gtk_tree_iter_new (void)
{
  return g_slice_new (GtkTreeIter);
}


/* GtkUIManager */

GtkWidget *
mlton_gtk_ui_manager_get_widget (GtkUIManager *manager,
                                 SML_CVECTOR_VAL(gchar, path))
{
  return gtk_ui_manager_get_widget (manager,
                                    GET_SML_CVECTOR_VAL(gchar, path));
}

guint
mlton_gtk_ui_manager_add_ui_from_string (GtkUIManager *manager,
                                         SML_CVECTOR_VAL(gchar, buffer),
                                         gssize length,
                                         GError **error)
{
  return gtk_ui_manager_add_ui_from_string (manager,
                                            GET_SML_CVECTOR_VAL(gchar, buffer),
                                            length,
                                            error);
}

guint
mlton_gtk_ui_manager_add_ui_from_file (GtkUIManager *manager,
                                       SML_CVECTOR_VAL(gchar, filename),
                                       GError **error)
{
  return gtk_ui_manager_add_ui_from_file (manager,
                                          GET_SML_CVECTOR_VAL(gchar, filename),
                                          error);
}


/* GtkWidget */

void
mlton_gtk_widget_style_get_property (GtkWidget *widget,
                                     SML_CVECTOR_VAL(gchar, property_name),
                                     GValue *value)
{
  gtk_widget_style_get_property (widget, GET_SML_CVECTOR_VAL(gchar, property_name), value);
}


/* GtkWindow */

void
mlton_gtk_window_set_title (GtkWindow *window,
                            SML_CVECTOR_VAL(gchar, title))
{
  gtk_window_set_title (window, GET_SML_CVECTOR_VAL(gchar, title));
}


/* Gtk */

void
mlton_gtk_init (int *argc, SML_CVECTORVECTOR_REF(gchar, argv))
{
  gtk_init (argc, GET_SML_CVECTORVECTOR_REF(gchar, argv));
}
