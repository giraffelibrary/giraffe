(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClassifyEvent :>
  CLASSIFY_EVENT
    where type 'a event_t = 'a GdkEvent.t
    where type event_any_record_t = GdkEventAnyRecord.t
    where type event_key_record_t = GdkEventKeyRecord.t
    where type event_button_record_t = GdkEventButtonRecord.t
    where type event_scroll_record_t = GdkEventScrollRecord.t
    where type event_motion_record_t = GdkEventMotionRecord.t
    where type event_expose_record_t = GdkEventExposeRecord.t
    where type event_visibility_record_t = GdkEventVisibilityRecord.t
    where type event_crossing_record_t = GdkEventCrossingRecord.t
    where type event_focus_record_t = GdkEventFocusRecord.t
    where type event_configure_record_t = GdkEventConfigureRecord.t
    where type event_property_record_t = GdkEventPropertyRecord.t
    where type event_selection_record_t = GdkEventSelectionRecord.t
    where type event_dnd_record_t = GdkEventDNDRecord.t
    where type event_proximity_record_t = GdkEventProximityRecord.t
    where type event_window_state_record_t = GdkEventWindowStateRecord.t
    where type event_setting_record_t = GdkEventSettingRecord.t
    where type event_owner_change_record_t = GdkEventOwnerChangeRecord.t
    where type event_grab_broken_record_t = GdkEventGrabBrokenRecord.t
    where type event_any_record_event = GdkEventAnyRecord.event
    where type event_key_record_event = GdkEventKeyRecord.event
    where type event_button_record_event = GdkEventButtonRecord.event
    where type event_scroll_record_event = GdkEventScrollRecord.event
    where type event_motion_record_event = GdkEventMotionRecord.event
    where type event_expose_record_event = GdkEventExposeRecord.event
    where type event_visibility_record_event = GdkEventVisibilityRecord.event
    where type event_crossing_record_event = GdkEventCrossingRecord.event
    where type event_focus_record_event = GdkEventFocusRecord.event
    where type event_configure_record_event = GdkEventConfigureRecord.event
    where type event_property_record_event = GdkEventPropertyRecord.event
    where type event_selection_record_event = GdkEventSelectionRecord.event
    where type event_dnd_record_event = GdkEventDNDRecord.event
    where type event_proximity_record_event = GdkEventProximityRecord.event
    where type event_window_state_record_event = GdkEventWindowStateRecord.event
    where type event_setting_record_event = GdkEventSettingRecord.event
    where type event_owner_change_record_event = GdkEventOwnerChangeRecord.event
    where type event_grab_broken_record_event = GdkEventGrabBrokenRecord.event =
  struct
    type 'a event_t = 'a GdkEvent.t
    type event_any_record_t = GdkEventAnyRecord.t
    type event_key_record_t = GdkEventKeyRecord.t
    type event_button_record_t = GdkEventButtonRecord.t
    type event_scroll_record_t = GdkEventScrollRecord.t
    type event_motion_record_t = GdkEventMotionRecord.t
    type event_expose_record_t = GdkEventExposeRecord.t
    type event_visibility_record_t = GdkEventVisibilityRecord.t
    type event_crossing_record_t = GdkEventCrossingRecord.t
    type event_focus_record_t = GdkEventFocusRecord.t
    type event_configure_record_t = GdkEventConfigureRecord.t
    type event_property_record_t = GdkEventPropertyRecord.t
    type event_selection_record_t = GdkEventSelectionRecord.t
    type event_dnd_record_t = GdkEventDNDRecord.t
    type event_proximity_record_t = GdkEventProximityRecord.t
    type event_window_state_record_t = GdkEventWindowStateRecord.t
    type event_setting_record_t = GdkEventSettingRecord.t
    type event_owner_change_record_t = GdkEventOwnerChangeRecord.t
    type event_grab_broken_record_t = GdkEventGrabBrokenRecord.t
    type event_any_record_event = GdkEventAnyRecord.event
    type event_key_record_event = GdkEventKeyRecord.event
    type event_button_record_event = GdkEventButtonRecord.event
    type event_scroll_record_event = GdkEventScrollRecord.event
    type event_motion_record_event = GdkEventMotionRecord.event
    type event_expose_record_event = GdkEventExposeRecord.event
    type event_visibility_record_event = GdkEventVisibilityRecord.event
    type event_crossing_record_event = GdkEventCrossingRecord.event
    type event_focus_record_event = GdkEventFocusRecord.event
    type event_configure_record_event = GdkEventConfigureRecord.event
    type event_property_record_event = GdkEventPropertyRecord.event
    type event_selection_record_event = GdkEventSelectionRecord.event
    type event_dnd_record_event = GdkEventDNDRecord.event
    type event_proximity_record_event = GdkEventProximityRecord.event
    type event_window_state_record_event = GdkEventWindowStateRecord.event
    type event_setting_record_event = GdkEventSettingRecord.event
    type event_owner_change_record_event = GdkEventOwnerChangeRecord.event
    type event_grab_broken_record_event = GdkEventGrabBrokenRecord.event


    datatype t =
      ANY          of event_any_record_t          * event_any_record_event
    | KEY          of event_key_record_t          * event_key_record_event
    | BUTTON       of event_button_record_t       * event_button_record_event
    | SCROLL       of event_scroll_record_t       * event_scroll_record_event
    | MOTION       of event_motion_record_t       * event_motion_record_event
    | EXPOSE       of event_expose_record_t       * event_expose_record_event
    | VISIBILITY   of event_visibility_record_t   * event_visibility_record_event
    | CROSSING     of event_crossing_record_t     * event_crossing_record_event
    | FOCUS        of event_focus_record_t        * event_focus_record_event
    | CONFIGURE    of event_configure_record_t    * event_configure_record_event
    | PROPERTY     of event_property_record_t     * event_property_record_event
    | SELECTION    of event_selection_record_t    * event_selection_record_event
    | DND          of event_dnd_record_t          * event_dnd_record_event
    | PROXIMITY    of event_proximity_record_t    * event_proximity_record_event
    | WINDOW_STATE of event_window_state_record_t * event_window_state_record_event
    | SETTING      of event_setting_record_t      * event_setting_record_event
    | OWNER_CHANGE of event_owner_change_record_t * event_owner_change_record_event
    | GRAB_BROKEN  of event_grab_broken_record_t  * event_grab_broken_record_event


    val eventType_ = _import "giraffe_gdk_get_event_type" : GdkEvent.C.notnull GdkEvent.C.p -> GdkEventType.C.val_;


    fun eventType self =
      (GdkEvent.C.withPtr ---> GdkEventType.C.fromVal) eventType_ self


    local
      fun mkT (con, fromPtr, ty) event = con (GdkEvent.C.withPtr (fromPtr false) event, ty)
    in
      fun classify e =
        case eventType e of
          GdkEventType.NOTHING             => NONE
        | GdkEventType.DELETE              => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.DELETE) e)
        | GdkEventType.DESTROY             => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.DESTROY) e)
        | GdkEventType.EXPOSE              => SOME (mkT (EXPOSE, GdkEventExposeRecord.C.fromPtr, GdkEventExposeRecord.EXPOSE) e)
        | GdkEventType.MOTION_NOTIFY       => SOME (mkT (MOTION, GdkEventMotionRecord.C.fromPtr, GdkEventMotionRecord.MOTION_NOTIFY) e)
        | GdkEventType.BUTTON_PRESS        => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.BUTTON_PRESS) e)
        | GdkEventType.DOUBLE_BUTTON_PRESS => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.DOUBLE_BUTTON_PRESS) e)
        | GdkEventType.TRIPLE_BUTTON_PRESS => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.TRIPLE_BUTTON_PRESS) e)
        | GdkEventType.BUTTON_RELEASE      => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.BUTTON_RELEASE) e)
        | GdkEventType.KEY_PRESS           => SOME (mkT (KEY, GdkEventKeyRecord.C.fromPtr, GdkEventKeyRecord.KEY_PRESS) e)
        | GdkEventType.KEY_RELEASE         => SOME (mkT (KEY, GdkEventKeyRecord.C.fromPtr, GdkEventKeyRecord.KEY_RELEASE) e)
        | GdkEventType.ENTER_NOTIFY        => SOME (mkT (CROSSING, GdkEventCrossingRecord.C.fromPtr, GdkEventCrossingRecord.ENTER_NOTIFY) e)
        | GdkEventType.LEAVE_NOTIFY        => SOME (mkT (CROSSING, GdkEventCrossingRecord.C.fromPtr, GdkEventCrossingRecord.LEAVE_NOTIFY) e)
        | GdkEventType.FOCUS_CHANGE        => SOME (mkT (FOCUS, GdkEventFocusRecord.C.fromPtr, GdkEventFocusRecord.FOCUS_CHANGE) e)
        | GdkEventType.CONFIGURE           => SOME (mkT (CONFIGURE, GdkEventConfigureRecord.C.fromPtr, GdkEventConfigureRecord.CONFIGURE) e)
        | GdkEventType.MAP                 => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.MAP) e)
        | GdkEventType.UNMAP               => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.UNMAP) e)
        | GdkEventType.PROPERTY_NOTIFY     => SOME (mkT (PROPERTY, GdkEventPropertyRecord.C.fromPtr, GdkEventPropertyRecord.PROPERTY_NOTIFY) e)
        | GdkEventType.SELECTION_CLEAR     => SOME (mkT (SELECTION, GdkEventSelectionRecord.C.fromPtr, GdkEventSelectionRecord.SELECTION_CLEAR) e)
        | GdkEventType.SELECTION_REQUEST   => SOME (mkT (SELECTION, GdkEventSelectionRecord.C.fromPtr, GdkEventSelectionRecord.SELECTION_REQUEST) e)
        | GdkEventType.SELECTION_NOTIFY    => SOME (mkT (SELECTION, GdkEventSelectionRecord.C.fromPtr, GdkEventSelectionRecord.SELECTION_NOTIFY) e)
        | GdkEventType.PROXIMITY_IN        => SOME (mkT (PROXIMITY, GdkEventProximityRecord.C.fromPtr, GdkEventProximityRecord.PROXIMITY_IN) e)
        | GdkEventType.PROXIMITY_OUT       => SOME (mkT (PROXIMITY, GdkEventProximityRecord.C.fromPtr, GdkEventProximityRecord.PROXIMITY_OUT) e)
        | GdkEventType.DRAG_ENTER          => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAG_ENTER) e)
        | GdkEventType.DRAG_LEAVE          => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAG_LEAVE) e)
        | GdkEventType.DRAG_MOTION         => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAG_MOTION) e)
        | GdkEventType.DRAG_STATUS         => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAG_STATUS) e)
        | GdkEventType.DROP_START          => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DROP_START) e)
        | GdkEventType.DROP_FINISHED       => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DROP_FINISHED) e)
        | GdkEventType.CLIENT_EVENT        => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.CLIENT_EVENT) e)
        | GdkEventType.VISIBILITY_NOTIFY   => SOME (mkT (VISIBILITY, GdkEventVisibilityRecord.C.fromPtr, GdkEventVisibilityRecord.VISIBILITY_NOTIFY) e)
        | GdkEventType.SCROLL              => SOME (mkT (SCROLL, GdkEventScrollRecord.C.fromPtr, GdkEventScrollRecord.SCROLL) e)
        | GdkEventType.WINDOW_STATE        => SOME (mkT (WINDOW_STATE, GdkEventWindowStateRecord.C.fromPtr, GdkEventWindowStateRecord.WINDOW_STATE) e)
        | GdkEventType.SETTING             => SOME (mkT (SETTING, GdkEventSettingRecord.C.fromPtr, GdkEventSettingRecord.SETTING) e)
        | GdkEventType.OWNER_CHANGE        => SOME (mkT (OWNER_CHANGE, GdkEventOwnerChangeRecord.C.fromPtr, GdkEventOwnerChangeRecord.OWNER_CHANGE) e)
        | GdkEventType.GRAB_BROKEN         => SOME (mkT (GRAB_BROKEN, GdkEventGrabBrokenRecord.C.fromPtr, GdkEventGrabBrokenRecord.GRAB_BROKEN) e)
        | GdkEventType.DAMAGE              => SOME (mkT (EXPOSE, GdkEventExposeRecord.C.fromPtr, GdkEventExposeRecord.DAMAGE) e)
        | GdkEventType.EVENT_LAST          => NONE
    end
  end
