# Simple Form での collection_radio_buttons の使い方

= f.collection_radio_buttons :eye_catch_send,
                              Article.eye_catch_sends_i18n,
                              :first,
                              :last


= f.collection_radio_buttons :eye_catch_send,
                              Article.eye_catch_sends_i18n,
                              :first,
                              :last,
                              item_wrapper_class: "d-block"