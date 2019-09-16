/// @description HTML5 only --- Polling the HTML5 adapter

if (os_browser != browser_not_a_browser) {
    //Update status
    status = __gmsio_html5_status__();
    //Fetch messages
    while (__gmsio_html5_has_message__()) {
        ds_queue_enqueue(inbox, __gmsio_html5_get_message__());
    }
}

