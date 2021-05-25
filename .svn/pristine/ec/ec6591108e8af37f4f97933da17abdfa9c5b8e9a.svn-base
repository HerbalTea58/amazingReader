$(function () {
    //轮播
    $('div[mod="index_lunbo"]').each(function () {
        var mod_area= $(this).data('area');
        var mod_btn = $(this).find('[mod="btn"]');
        var mod_txt = $(this).find('[mod="txt"]');
        var mod_pic = $(this).find('[mod="pic"]');
        var pic_width = mod_pic.find('li:eq(0)').width();
        mod_pic.css({'position': 'relative', 'width': function () {
            return $(this).find('li').length * pic_width;
        }}).find('li').each(function (i) {
            mod_btn.append('<li' + (i == 0 ? ' class="on"' : '') + '></li>');
        });
        var width = 0;
        mod_btn.find('li').each(function () {
            width += $(this).outerWidth(true);
        });
        if (mod_area == 'nan') {
            //mod_btn.css('margin-left', -(width / 2 + 20) + 'px');
        }
        mod_btn.width(width).find('li').on('mouseover', function (e) {
            e.stopPropagation();
            $(this).addClass('on').siblings('li').removeClass('on');
            var $left = -$(this).index() * pic_width;
            mod_pic.stop().animate({'left': $left}, 300).find('img:eq('+$(this).index()+')').trigger('lb');
            var cur_btn = mod_pic.find('li:eq(' + $(this).index() + ')').find('a');
            var desc = cur_btn.data('desc');
            var title = cur_btn.attr('title');
            var href = cur_btn.attr('href');
            mod_txt.find('p').text(desc).end().find('a').attr({'title': title, 'href': href}).text(title);
        }).eq(0).mouseover();
        var mod_lunbo = $(this);
        setInterval(function () {
            if (mod_lunbo.attr('status') != 'stop') {
                var cur_index = mod_btn.find('li.on').index();
                var next_index = cur_index == mod_btn.find('li').length - 1 ? 0 : cur_index + 1;
                mod_btn.find('li:eq(' + next_index + ')').mouseover();
            }
        }, 3000);
        $(this).on({'mouseenter': function () { mod_lunbo.attr('status', 'stop'); }, 'mouseleave': function () { mod_lunbo.attr('status', 'start'); }});
        //mod_pic.on({'mouseenter': function () { mod_lunbo.attr('status', 'stop'); }, 'mouseleave': function () { mod_lunbo.attr('status', 'start'); }});
        //mod_txt.on({'mouseenter': function () { mod_lunbo.attr('status', 'stop'); }, 'mouseleave': function () { mod_lunbo.attr('status', 'start'); }});
        zy.lazyload_init('img.lazyload_lb', {failure_limit: 0, event: 'lb', container: $(this)});
    });
    //作品更新
    $('div[mod="btn_book_class"] span').on('click', function () {
        $(this).addClass('on').siblings('span').removeClass('on');
        $(this).parent().next().children('ol:eq(' + ($(this).index() == 2 ? 1 : 0) + ')').addClass('cur').siblings().removeClass('cur');
    }).eq(0).click();
    //榜单
    $('[mod=rank_data_list] li').on('mouseover', function () {
        $(this).addClass('lis_sh').siblings('li').removeClass('lis_sh');
    });
    //热门推荐
    $('[mod="hot_tj"] li').on({
        'mouseover': function () {
            $(this).addClass('on')
        },
        'mouseout': function () {
            $(this).removeClass('on');
        }
    });

    //女频
    $('#btn_index_lb_nv li').on('mouseover', function () {
        var index = $(this).index();
        $(this).addClass('on').siblings('li').removeClass('on');
        var pic = $('#mod_index_lb_nv_pic li:eq(' + index + ')');
        var url = pic.find('a').attr('href');
        var title = pic.find('a').attr('title');
        var desc = $(this).data('desc');
        pic.show().find('img').trigger('lb').end().siblings('li').hide();
        $('#mod_index_lb_nv_txt').find('a').text(title).attr('title', title).attr('href', url)
            .end().find('p').text(desc);
    });
    zy.lazyload_init('img.lazyload_lb_nv', {failure_limit: 0, event: 'lb', container: $('#mod_index_lb_nv_pic')});

    // 榜单
    $('#tj_list li').on('mouseover', function () { $(this).addClass('cur').siblings('li').removeClass('cur'); } );
    $('.list_wrap li').on('mouseover', function () { $(this).addClass('lis_sh').siblings('li').removeClass('lis_sh'); } );


});