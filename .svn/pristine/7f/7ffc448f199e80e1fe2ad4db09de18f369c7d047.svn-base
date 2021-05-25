
var zy = {};

//重写一下，默认的msg
layer._msg = layer.msg;
layer.msg = function (msg, json) {
    json = json ? json : {shift: 8, time: 2000};
    layer._msg(msg, json);
};

zy.layer_login = {
    'check': function () {
        if (typeof(user_id) == undefined || user_id == '' || user_id == '0') {
            this.show();
            return false;
        } else {
            return true;
        }
    },
    'show': function () {
        var $this = this;
        var layer_loading = layer.load(1, {shade: 0.3});
        $.get('/index.php?ca=user.layer_login', function (res) {
            layer.close(layer_loading);
            layer.open({type: 1, shift: 5, title: false,
                area: ['480px', '423px'],
                content: res,
                success: function (obj, index) {
                    $this.bind_handle();
                }
            });
        });
    },
    'bind_handle': function () {
        $('#form_layer_login').on('keypress', function (e) {
            if(e.keyCode == 13) $('#btn_submit_layer_login').click();
        });
        $('#btn_submit_layer_login').on('click', function () {
            var btn = this;
            var params = $('#form_layer_login').serializeArray();
            var error =0;
            var mod_msg = $('#mod_msg_layer_login');
            $.each(params, function (i, line) {
                if (line.value == '') {
                    error = 1;
                    var input = $('#form_layer_login input[name="' + line.name + '"]');
                    mod_msg.show().html('<i></i> 请' + input.attr('placeholder'));
                    input.focus();
                    return false;
                }
            });
            if ($(btn).data('status') == 'loading' || error == 1) return false;
            $(btn).data('status', 'loading');
            function success(ret) {
                if (ret.status == 1) {
                    window.location.reload();
                } else {
                    layer.close(layer_loading);mod_msg.show().html('<i></i> ' + ret.msg);
                }
            }
            mod_msg.hide();
            var layer_loading = layer.load(1);
            $.ajax({
                'url': '/login/', 'data': params, dataType: 'json',
                'success': success,
                'complete': function (response, status) {
                    $(btn).data('status', 'complete');
                    if (status != 'success') { layer.close(layer_loading); mod_msg.show().html('<i>!</i> 请求失败'); }
                }
            });
        });
    }
};

//头部搜索
zy.top_search_init = function () {

};

zy.cookie = {
    'set': function (key, value, options) {
        options = $.extend({'path': '/', 'domain': '.yc.ireader.com.cn', 'expires': 365}, options);
        if (value === null) {
            options.expires = -1;
        }
        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }
        value = String(value);
        return (document.cookie = [
            encodeURIComponent(key), '=', encodeURIComponent(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '',
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
        ].join(''));
    },
    'get': function (key) {
        var cookies = document.cookie.split('; ');
        for (var i = 0, l = cookies.length; i < l; i++) {
            var parts = cookies[i].split('=');
            var name = encodeURIComponent(parts.shift());
            var cookie = encodeURIComponent(parts.join('='));

            if (key && key === name) {
                return cookie;
            }
        }
        return null;
    }
};

zy.back_top = function () {
    var btn_back_up = $('#btn_back_top');
    var $left = ($(window).width() + 1100)/2 + 20;
    $(window).bind({
        'resize': function () {
            btn_back_up.css('left', $left);
        },
        'scroll': function () {
            if ($(window).scrollTop() > 0) {
                btn_back_up.css('left', $left).fadeIn(300);
            } else {
                btn_back_up.stop(false, true).fadeOut(300);
            }
        }
    });
    btn_back_up.find('img').on({
        'click': function () {
            $('body, html').animate({scrollTop: 0}, 200);
        },
        'mouseover': function () {
            $(this).attr('ysrc', function () {
                return $(this).attr('src');
            }).attr('src', function () {
                return $(this).data('src');
            });
        },
        'mouseout': function () {
            $(this).attr('src', function () {
                return $(this).attr('ysrc');
            });
        }
    });
};

zy.lazyload_init = function (selector, options) {
    if (!selector) {
        selector = 'img.lazyload, img.lazyload_book_cover, img.lazyload_avatar';
    }
    options = $.extend({data_attribute: 'src', failure_limit: 10, effect: 'fadeIn'}, options ? options : {});
    $(selector).lazyload(options);
};

$(function () {

    zy.lazyload_init();

    zy.back_top();

    zy.top_search_init();

    $('#mod_login_after').on({
        'mouseover': function () {
            $(this).children('ul').show();
        },
        'mouseout': function () {
            $(this).children('ul').hide();
        }
    });

});
