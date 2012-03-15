var AdminPages = function() {

    return {
        initCopyPaste : function(that) {
            $(that).zclip({
                    path:'/uploadify/ZeroClipboard.swf',
                    copy: $(that).parent().find(".url").text()
                }
            );
        }
    }
}();
