/* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gtk C interface support for MLton
 */

#include <string.h>
#include <gtk/gtk.h>

#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"


/* GtkAccelKey */

GtkAccelKey *
giraffe_gtk_accel_key_new (void)
{
  return g_slice_new (GtkAccelKey);
}

void
giraffe_gtk_accel_key_copy (const GtkAccelKey *src, GtkAccelKey *dest)
{
  memcpy (dest, src, sizeof (GtkAccelKey));
}

void
giraffe_gtk_accel_key_free (GtkAccelKey *key)
{
  g_slice_free (GtkAccelKey, key);
}

guint
giraffe_gtk_accel_key_size (void)
{
  return sizeof (GtkAccelKey);
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


/* GtkApplication */

GtkApplication *
mlton_gtk_application_new (SML_CVECTOR_VAL(gchar, application_id),
                           GApplicationFlags flags)
{
  return gtk_application_new (GET_SML_CVECTOR_VAL(gchar, application_id),
                              flags);
}


/* GtkBorder */

GtkBorder *
giraffe_gtk_border_new (void)
{
  return g_slice_new (GtkBorder);
}

void
giraffe_gtk_border_copy (const GtkBorder *src, GtkBorder *dest)
{
  memcpy (dest, src, sizeof (GtkBorder));
}

void
giraffe_gtk_border_free (GtkBorder *border)
{
  g_slice_free (GtkBorder, border);
}

guint
giraffe_gtk_border_size (void)
{
  return sizeof (GtkBorder);
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

void
giraffe_gtk_file_filter_info_copy (const GtkFileFilterInfo *src, GtkFileFilterInfo *dest)
{
  memcpy (dest, src, sizeof (GtkFileFilterInfo));
}

void
giraffe_gtk_file_filter_info_free (GtkFileFilterInfo *info)
{
  g_slice_free (GtkFileFilterInfo, info);
}

guint
giraffe_file_filter_info_size (void)
{
  return sizeof (GtkFileFilterInfo);
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


/* GtkRecentData */

GtkRecentData *
giraffe_gtk_recent_data_new (void)
{
  return g_slice_new (GtkRecentData);
}

void
giraffe_gtk_recent_data_copy (const GtkRecentData *src, GtkRecentData *dest)
{
  memcpy (dest, src, sizeof (GtkRecentData));
}

void
giraffe_gtk_recent_data_free (GtkRecentData *data)
{
  g_slice_free (GtkRecentData, data);
}

guint
giraffe_gtk_recent_data_size (void)
{
  return sizeof (GtkRecentData);
}


/* GtkRecentFilterInfo */

GtkRecentFilterInfo *
giraffe_gtk_recent_filter_info_new (void)
{
  return g_slice_new (GtkRecentFilterInfo);
}

void
giraffe_gtk_recent_filter_info_copy (const GtkRecentFilterInfo *src, GtkRecentFilterInfo *dest)
{
  memcpy (dest, src, sizeof (GtkRecentFilterInfo));
}

void
giraffe_gtk_recent_filter_info_free (GtkRecentFilterInfo *info)
{
  g_slice_free (GtkRecentFilterInfo, info);
}

guint
giraffe_gtk_recent_filter_info_size (void)
{
  return sizeof (GtkRecentFilterInfo);
}


/* GtkRequisition */

GtkRequisition *
giraffe_gtk_requisition_new (void)
{
  return g_slice_new (GtkRequisition);
}

void
giraffe_gtk_requisition_copy (const GtkRequisition *src, GtkRequisition *dest)
{
  memcpy (dest, src, sizeof (GtkRequisition));
}

void
giraffe_gtk_requisition_free (GtkRequisition *requisition)
{
  g_slice_free (GtkRequisition, requisition);
}

guint
giraffe_gtk_requisition_size (void)
{
  return sizeof (GtkRequisition);
}


/* GtkSettingsValue */

GtkSettingsValue *
giraffe_gtk_settings_value_new (void)
{
  return g_slice_new (GtkSettingsValue);
}

void
giraffe_gtk_settings_value_copy (const GtkSettingsValue *src, GtkSettingsValue *dest)
{
  memcpy (dest, src, sizeof (GtkSettingsValue));
}

void
giraffe_gtk_settings_value_free (GtkSettingsValue *settings_value)
{
  g_slice_free (GtkSettingsValue, settings_value);
}

guint
giraffe_gtk_settings_value_size (void)
{
  return sizeof (GtkSettingsValue);
}


/* GtkStockItem */

GtkStockItem *
giraffe_gtk_stock_item_new (void)
{
  return g_slice_new (GtkStockItem);
}

void
giraffe_gtk_stock_item_copy (const GtkStockItem *src, GtkStockItem *dest)
{
  memcpy (dest, src, sizeof (GtkStockItem));
}

void
giraffe_gtk_stock_item_free (GtkStockItem *stock_item)
{
  g_slice_free (GtkStockItem, stock_item);
}

guint
giraffe_gtk_stock_item_size (void)
{
  return sizeof (GtkStockItem);
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

void
giraffe_gtk_text_iter_copy (const GtkTextIter *src, GtkTextIter *dest)
{
  memcpy (dest, src, sizeof (GtkTextIter));
}

void
giraffe_gtk_text_iter_free (GtkTextIter *text_iter)
{
  g_slice_free (GtkTextIter, text_iter);
}

guint
giraffe_gtk_text_iter_size (void)
{
  return sizeof (GtkTextIter);
}


/* GtkTreeIter */

GtkTreeIter *
giraffe_gtk_tree_iter_new (void)
{
  return g_slice_new (GtkTreeIter);
}

void
giraffe_gtk_tree_iter_copy (const GtkTreeIter *src, GtkTreeIter *dest)
{
  memcpy (dest, src, sizeof (GtkTreeIter));
}

void
giraffe_gtk_tree_iter_free (GtkTreeIter *tree_iter)
{
  g_slice_free (GtkTreeIter, tree_iter);
}

guint
giraffe_gtk_tree_iter_size (void)
{
  return sizeof (GtkTreeIter);
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
