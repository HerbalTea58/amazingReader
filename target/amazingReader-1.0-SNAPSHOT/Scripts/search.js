
if(typeof(zy) == 'undefined')  var zy = {};

zy.search = {
    'fav_url': '/index.php?ca=book.fav',

    'url': '/index.php?ca=search.index&ajax_load=1',

    'params': {},

    'clear_params': function () {
        var $this = this;
        $.each(this.params, function (key, val) {
            if (key == 'keyword') {
                $('input[name=search_keyword]').val('');
            }
            else if (val != '' && val != 0 && val != 'all' && val != 'default') {
                switch (key) {
                    case 'channel':
                    case 'category':
                    case 'min_category': $this.category_change('channel', 'all'); break;
                    default:
                        $('a[btn="search_params"][data-key="' + key + '"]:eq(0)').addClass('on').parent().siblings().find('a').removeClass('on');
                }
            }
        });
        $this.params = {};
        $this.load_data($this.params);
    },

    'set_params': function (key, val) {
        var $this = this;
        this.params[key] = val;
        var html = '';
        $.each(this.params, function (key, val) {
            if (key == 'keyword') {
                html += val != '' ? '<span data-key="' + key + '">' + $('<div>').text(val).html() + '<s btn="close"></s></span>' : '';
            } else if (val != '' && val != 0 && val != 'all' && val != 'default') {
                var btn = 'search_params';
                switch (key) {
                    case 'channel':
                    case 'category':
                    case 'min_category': btn = 'search_category'; break;
                }
                var txt = $('a[btn="' + btn + '"][data-key="' + key + '"][data-val="' + val + '"]').text();
                html += '<span data-btn="' + btn + '" data-key="' + key + '">' + txt + '<s btn="close"></s></span>';
            }
        });
        html = html != '' ? html + '<i btn="close" data-type="clear">清空筛选</i>' : '';
        var mod = $('[mod=search_params]');
        mod.html(html).find('[btn=close]').on('click', function () {
            if ($(this).data('type') == 'clear') {
                $this.clear_params();
                mod.html('').hide();
                return;
            }
            var span = $(this).parent();
            if (span.data('key') == 'keyword') {
                $('input[name=search_keyword]').val('');
                $this.set_params('keyword', '');
                $this.load_data($this.params);
            } else {
                $('a[btn="' + span.data('btn') + '"][data-key="' +  span.data('key') + '"]:eq(0)').click();
            }
        }).end().show();
        if (html == '') mod.hide();
    },

    'bind': function () {
        var $this = zy.search;
        //筛选项
        $('[btn=search_params]').on('click', function () {
            var key = $(this).data('key');
            var val = $(this).data('val');
            $this.set_params(key, val);
            $this.load_data($this.params);
            $(this).addClass('on').parent().siblings().find('a').removeClass('on');
            return false;
        });
        //频道、分类筛选
        $('[btn=search_category]').on('click', function () {
            var key = $(this).data('key');
            var val = $(this).data('val');
            zy.search.category_change(key, val);
            $this.load_data($this.params);
            return false;
        });
        //搜索
        $('[btn=search_keyword]').on('click', function () {
            var keyword = $('input[name=search_keyword]').val();
            if (keyword != '') {
                $this.set_params('keyword', keyword);
                $this.load_data($this.params);
            }
            return false;
        });
        //回车搜索
        $('input[name=search_keyword]').on('keyup', function (e) {
            if (e.keyCode == 13) {
                $('[btn=search_keyword]').click();
            }
        });

        zy.search.bind_data_list_btn();
    },

    //切换状态
    'category_change': function (key, val) {
        function change_status(key, val) {
            zy.search.set_params(key, val);
            $('[btn=search_category][data-key=' + key + '][data-val=' + val + ']').addClass('on')
                .parent().siblings().find('a').removeClass('on');
        }
        var mod_category = $('[mod=search_category]');
        var mod_min_category = $('[mod=search_min_category]');
        if (key == 'channel') {
            change_status('category', 0);
            change_status('min_category', 0);
            mod_category.show();
            mod_min_category.hide();
            if (val == 'all') {
                mod_category.hide();
            } else {
                mod_category.find('[mod=search_category_channel_' + val + ']').show().siblings('[mod]').hide();
            }
        } else if (key == 'category') {
            change_status('min_category', 0);
            mod_category.show();
            mod_min_category.show();
            if (val == 0) {
                mod_min_category.hide();
            } else {
                mod_min_category.find('[mod=search_min_category_category_' + val + ']').show().siblings('[mod]').hide();
            }
        } else if (key == 'min_category') {
            mod_category.show();
            mod_min_category.show();
        }
        change_status(key, val);
    },

    //list内的筛选按钮
    'bind_data_list_btn': function () {
        var $this = zy.search;
        //tags
        $('[btn=search_tag]').on('click', function () {
            var val = $(this).text()
            $this.set_params('keyword', val);
            $this.load_data($this.params);
            $('input[name=search_keyword]').val(val);
            return false;
        });
        //分类
        $('[btn=data_search_category]').on('click', function () {
            var min_category = $(this).data('min_category');
            var category = $(this).data('category');
            var channel = $(this).data('channel');
            $this.category_change('channel', channel);
            $this.category_change('category', category);
            $this.category_change('min_category', min_category);
            $this.load_data($this.params);
            return false;
        });
        //页码
        $('[mod=search_page]').find('[btn=data_page]').on('click', function () {
            var page = $(this).data('page');
            var params = $.parseJSON(JSON.stringify($this.params));
            params['page'] = page;
            $this.load_data(params, page);
            return false;
        });
        //收藏
        $('[btn=book_fav]').on('click', function () {
            $this.book_fav(this);
        });
        zy.search.set_keyword_highlight($this.params.keyword);
    },

    //加载数据
    'load_data': function (params) {
        var layer_loading = layer.load(1, {shade: 0.1});
        $.ajax({
            'url': zy.search.url,
            'data': params,
            'success': function (html) {
                $('[mod=search_data_list]').html(html);
                zy.search.bind_data_list_btn();
                var top = $('[mod="search_channel"]').parent().children().first().offset().top;
                $('html, body').animate({scrollTop: top}, 200);
                zy.lazyload_init();
            },
            'complete': function (response, status) {
                layer.close(layer_loading);
                if (status != 'success') {
                    layer.msg('加载失败');
                }
            }
        });
    },

    //高亮关键词
    'set_keyword_highlight': function (keyword) {
        if (!keyword || keyword == '') return;
        $('[mod=data_book_name], [mod=data_book_author], [btn=data_search_category], [btn=search_tag], [mod=data_book_desc]').html(function () {
            return $(this).html().replace(keyword, '<font color="red">' + keyword + '</font>');
        });
    },

    //收藏
    'book_fav': function (btn) {
        if (!zy.layer_login.check()) return false;
        if (zy.search.fav_status == 'loading') return false;
        zy.search.fav_status = 'loading';
        var bid = $(btn).data('bid'), act = $(btn).data('act');
        function success(ret) {
            layer.msg(ret.msg);
            if (ret.status == 1) {
                //切换状态
                if (act == 'cancel') {
                    $(btn).data('act', 'fav').text('加入书架');
                    return;
                }
                $(btn).data('act', 'cancel').text('取消收藏');
            }
        }

        layer.closeAll();
        var layer_loading = layer.load(1);
        $.ajax({
            'url': zy.search.fav_url, 'data' : {'bid': bid, 'act': act},
            'success': success,
            'complete': function (response, status) {
                zy.search.fav_status = 'complate';
                layer.close(layer_loading);
                if (status != 'success') layer.msg('请求失败');
            }
        });
    }
};
