var AdminPages = function() {

    return {
        initClipboard : function() {
            $('a.clipboard-link').zclip({
                path:'/zeroclipboard/ZeroClipboard.swf',
                copy: function() {
                    return $(this).closest('tr').find('a.url').attr("href");
                },
                setHandCursor: true,
                clickAfter: false
            });
        }
    }
}();
