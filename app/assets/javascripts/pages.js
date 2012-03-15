var AdminPages = function() {

    return {
        initCopyPaste : function() {
            $('.icon-copypaste').zclip({
                    path:'/uploadify/ZeroClipboard.swf',
                    copy: $(this).parent().find(".url").text,
                    clickAfter: false
                }
            );
        }
    }
}();
