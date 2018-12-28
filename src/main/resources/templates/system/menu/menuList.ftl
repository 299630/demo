<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>菜单管理</title>

    <link rel="stylesheet" type="text/css" href="/ui/fontIconPicker/css/jquery.fonticonpicker.min.css" />
    <link rel="stylesheet" type="text/css" href="/ui/fontIconPicker/themes/bootstrap-theme/jquery.fonticonpicker.bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/ui/font-awesome-4.7.0/css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" id="eayuiThemes" href="/ui/easyui/themes/metro/easyui.css" />
    <link type="text/css" rel="stylesheet" id="eayuiThemes" href="/ui/easyui/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/ui/easyui/demo/demo.css">
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/ui/fontIconPicker/jquery.fonticonpicker.min.js"></script>
    <script type="text/javascript" src="/ui/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/ui/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',border:false">
        <!-- 工具栏↓ -->
        <div id="toolbar">
            <div class="toolbar-button">
                <a href="#" class="easyui-linkbutton" id="save" data-options="iconCls:'icon-add', plain:true"  onclick="add()" >添加</a>
                <a href="#" class="easyui-linkbutton" id="save" data-options="iconCls:'icon-edit', plain:true"  onclick="upd()" >修改</a>
            </div>
        </div>
        <!-- 工具栏↑ -->
        <table id="treegrid"
               data-options="toolbar:'#toolbar'">
            <thead>
                <tr>
                    <th data-options="field:'menuName', width:150, align:'center', halign:'center'">菜单名称</th>
                    <th data-options="field:'menuUrl', width:150, align:'left', halign:'center'">菜单路径</th>
                    <th data-options="field:'status', width:150, align:'center', halign:'center'">菜单类型</th>
                    <th data-options="field:'menuIcon', width:150, align:'left', halign:'center',formatter:menuIcon">图标</th>
                    <th data-options="field:'permission', width:150, align:'left', halign:'center'">权限标识</th>
                    <th data-options="field:'menuSort', width:100, align:'center', halign:'center'">排序</th>
                </tr>
            </thead>
        </table>
        <div id="dlg" class="easyui-dialog" style="width:800px;height:520px;padding:10px 20px"
             data-options="closed:true, buttons:'#dlg-buttons'">
            <form id="fm" method="post" style="position: relative; left:20px;">
                <div class="fitem">
                    <label>菜单名称：</label>
                    <input name="menuName" class="easyui-textbox" data-options="required:true" />
                </div><br>
                <div class="fitem">
                    <label>菜单路径：</label>
                    <input name="menuUrl" class="easyui-textbox" data-options="required:true" />
                </div><br>
                <div class="fitem">
                    <label>菜单类型：</label>
                    <input name="status" class="easyui-textbox" data-options="required:true" />
                </div><br>
                <div class="fitem">
                    <label>菜单图标：</label>
                    <input type="text" id="picker" name="menuIcon"/>
                </div><br>
                <div class="fitem">
                    <label>权限标识：</label>
                    <input name="permission" class="easyui-textbox"  data-options="required:true" />
                </div><br>
                <div class="fitem">
                    <label>上级菜单：</label>
                    <input name="parentId" id="tt" />
                </div><br>
                <div class="fitem">
                    <label>排序：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <input name="menuSort" class="easyui-textbox" data-options="required:true" />
                </div><br>
            </form>
        </div>
        <div id="dlg-buttons">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="save()">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dlg').dialog('close')">取消</a>
        </div>

        <div id="dlgs" class="easyui-dialog" style="width:800px;height:520px;padding:10px 20px"
             data-options="closed:true, buttons:'#dlgs-buttons'">
            <table id="treegrid" data-options="toolbar:'#toolbar'">
        </div>
        <div id="dlgs-buttons">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="save1()">确定</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dlgs').dialog('close')">取消</a>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        var icm_icons = {
            '网页应用图标' : ['fa fa-address-book', 'fa fa-address-book-o', 'fa fa-address-card', 'fa fa-address-card-o', 'fa fa-adjust', 'fa fa-american-sign-language-interpreting', 'fa fa-anchor', 'fa fa-archive', 'fa fa-area-chart', 'fa fa-arrows', 'fa fa-arrows-h', 'fa fa-arrows-v', 'fa fa-asl-interpreting', 'fa fa-assistive-listening-systems', 'fa fa-asterisk', 'fa fa-at', 'fa fa-audio-description', 'fa fa-automobile', 'fa fa-balance-scale', 'fa fa-ban', 'fa fa-bank', 'fa fa-bar-chart', 'fa fa-bar-chart-o', 'fa fa-barcode', 'fa fa-bars', 'fa fa-bath', 'fa fa-bathtub', 'fa fa-battery', 'fa fa-battery-0', 'fa fa-battery-1', 'fa fa-battery-2', 'fa fa-battery-3', 'fa fa-battery-4', 'fa fa-battery-empty', 'fa fa-battery-full', 'fa fa-battery-half', 'fa fa-battery-quarter', 'fa fa-battery-three-quarters', 'fa fa-bed', 'fa fa-beer', 'fa fa-bell', 'fa fa-bell-o', 'fa fa-bell-slash', 'fa fa-bell-slash-o', 'fa fa-bicycle', 'fa fa-binoculars', 'fa fa-birthday-cake', 'fa fa-blind', 'fa fa-bluetooth', 'fa fa-bluetooth-b', 'fa fa-bolt', 'fa fa-bomb', 'fa fa-book', 'fa fa-bookmark', 'fa fa-bookmark-o', 'fa fa-braille', 'fa fa-briefcase', 'fa fa-bug', 'fa fa-building', 'fa fa-building-o', 'fa fa-bullhorn', 'fa fa-bullseye', 'fa fa-bus', 'fa fa-cab', 'fa fa-calculator', 'fa fa-calendar', 'fa fa-calendar-check-o', 'fa fa-calendar-minus-o', 'fa fa-calendar-o', 'fa fa-calendar-plus-o', 'fa fa-calendar-times-o', 'fa fa-camera', 'fa fa-camera-retro', 'fa fa-car', 'fa fa-caret-square-o-down', 'fa fa-caret-square-o-left', 'fa fa-caret-square-o-right', 'fa fa-caret-square-o-up', 'fa fa-cart-arrow-down', 'fa fa-cart-plus', 'fa fa-cc', 'fa fa-certificate', 'fa fa-check', 'fa fa-check-circle', 'fa fa-check-circle-o', 'fa fa-check-square', 'fa fa-check-square-o', 'fa fa-child', 'fa fa-circle', 'fa fa-circle-o', 'fa fa-circle-o-notch', 'fa fa-circle-thin', 'fa fa-clock-o', 'fa fa-clone', 'fa fa-close', 'fa fa-cloud', 'fa fa-cloud-download', 'fa fa-cloud-upload', 'fa fa-code', 'fa fa-code-fork', 'fa fa-coffee', 'fa fa-cog', 'fa fa-cogs', 'fa fa-comment', 'fa fa-comment-o', 'fa fa-commenting', 'fa fa-commenting-o', 'fa fa-comments', 'fa fa-comments-o', 'fa fa-compass', 'fa fa-copyright', 'fa fa-creative-commons', 'fa fa-credit-card', 'fa fa-credit-card-alt', 'fa fa-crop', 'fa fa-crosshairs', 'fa fa-cube', 'fa fa-cubes', 'fa fa-cutlery', 'fa fa-dashboard', 'fa fa-database', 'fa fa-deaf', 'fa fa-deafness', 'fa fa-desktop', 'fa fa-diamond', 'fa fa-dot-circle-o', 'fa fa-download', 'fa fa-drivers-license', 'fa fa-drivers-license-o', 'fa fa-edit', 'fa fa-ellipsis-h', 'fa fa-ellipsis-v', 'fa fa-envelope', 'fa fa-envelope-o', 'fa fa-envelope-open', 'fa fa-envelope-open-o', 'fa fa-envelope-square', 'fa fa-eraser', 'fa fa-exchange', 'fa fa-exclamation', 'fa fa-exclamation-circle', 'fa fa-exclamation-triangle', 'fa fa-external-link', 'fa fa-external-link-square', 'fa fa-eye', 'fa fa-eye-slash', 'fa fa-eyedropper', 'fa fa-fax', 'fa fa-feed', 'fa fa-female', 'fa fa-fighter-jet', 'fa fa-file-archive-o', 'fa fa-file-audio-o', 'fa fa-file-code-o', 'fa fa-file-excel-o', 'fa fa-file-image-o', 'fa fa-file-movie-o', 'fa fa-file-pdf-o', 'fa fa-file-photo-o', 'fa fa-file-picture-o', 'fa fa-file-powerpoint-o', 'fa fa-file-sound-o', 'fa fa-file-video-o', 'fa fa-file-word-o', 'fa fa-file-zip-o', 'fa fa-film', 'fa fa-filter', 'fa fa-fire', 'fa fa-fire-extinguisher', 'fa fa-flag', 'fa fa-flag-checkered', 'fa fa-flag-o', 'fa fa-flash', 'fa fa-flask', 'fa fa-folder', 'fa fa-folder-o', 'fa fa-folder-open', 'fa fa-folder-open-o', 'fa fa-frown-o', 'fa fa-futbol-o', 'fa fa-gamepad', 'fa fa-gavel', 'fa fa-gear', 'fa fa-gears', 'fa fa-gift', 'fa fa-glass', 'fa fa-globe', 'fa fa-graduation-cap', 'fa fa-group', 'fa fa-hand-grab-o', 'fa fa-hand-lizard-o', 'fa fa-hand-paper-o', 'fa fa-hand-peace-o', 'fa fa-hand-pointer-o', 'fa fa-hand-rock-o', 'fa fa-hand-scissors-o', 'fa fa-hand-spock-o', 'fa fa-hand-stop-o', 'fa fa-handshake-o', 'fa fa-hard-of-hearing', 'fa fa-hashtag', 'fa fa-hdd-o', 'fa fa-headphones', 'fa fa-heart', 'fa fa-heart-o', 'fa fa-heartbeat', 'fa fa-history', 'fa fa-home', 'fa fa-hotel', 'fa fa-hourglass', 'fa fa-hourglass-1', 'fa fa-hourglass-2', 'fa fa-hourglass-3', 'fa fa-hourglass-end', 'fa fa-hourglass-half', 'fa fa-hourglass-o', 'fa fa-hourglass-start', 'fa fa-i-cursor', 'fa fa-id-badge', 'fa fa-id-card', 'fa fa-id-card-o', 'fa fa-image', 'fa fa-inbox', 'fa fa-industry', 'fa fa-info', 'fa fa-info-circle', 'fa fa-institution', 'fa fa-key', 'fa fa-keyboard-o', 'fa fa-language', 'fa fa-laptop', 'fa fa-leaf', 'fa fa-legal', 'fa fa-lemon-o', 'fa fa-level-down', 'fa fa-level-up', 'fa fa-life-bouy', 'fa fa-life-buoy', 'fa fa-life-ring', 'fa fa-life-saver', 'fa fa-lightbulb-o', 'fa fa-line-chart', 'fa fa-location-arrow', 'fa fa-lock', 'fa fa-low-vision', 'fa fa-magic', 'fa fa-magnet', 'fa fa-mail-forward', 'fa fa-mail-reply', 'fa fa-mail-reply-all', 'fa fa-male', 'fa fa-map', 'fa fa-map-marker', 'fa fa-map-o', 'fa fa-map-pin', 'fa fa-map-signs', 'fa fa-meh-o', 'fa fa-microchip', 'fa fa-microphone', 'fa fa-microphone-slash', 'fa fa-minus', 'fa fa-minus-circle', 'fa fa-minus-square', 'fa fa-minus-square-o', 'fa fa-mobile', 'fa fa-mobile-phone', 'fa fa-money', 'fa fa-moon-o', 'fa fa-mortar-board', 'fa fa-motorcycle', 'fa fa-mouse-pointer', 'fa fa-music', 'fa fa-navicon', 'fa fa-newspaper-o', 'fa fa-object-group', 'fa fa-object-ungroup', 'fa fa-paint-brush', 'fa fa-paper-plane', 'fa fa-paper-plane-o', 'fa fa-paw', 'fa fa-pencil', 'fa fa-pencil-square', 'fa fa-pencil-square-o', 'fa fa-percent', 'fa fa-phone', 'fa fa-phone-square', 'fa fa-photo', 'fa fa-picture-o', 'fa fa-pie-chart', 'fa fa-plane', 'fa fa-plug', 'fa fa-plus', 'fa fa-plus-circle', 'fa fa-plus-square', 'fa fa-plus-square-o', 'fa fa-podcast', 'fa fa-power-off', 'fa fa-print', 'fa fa-puzzle-piece', 'fa fa-qrcode', 'fa fa-question', 'fa fa-question-circle', 'fa fa-question-circle-o', 'fa fa-quote-left', 'fa fa-quote-right', 'fa fa-random', 'fa fa-recycle', 'fa fa-refresh', 'fa fa-registered', 'fa fa-remove', 'fa fa-reorder', 'fa fa-reply', 'fa fa-reply-all', 'fa fa-retweet', 'fa fa-road', 'fa fa-rocket', 'fa fa-rss', 'fa fa-rss-square', 'fa fa-s15', 'fa fa-search', 'fa fa-search-minus', 'fa fa-search-plus', 'fa fa-send', 'fa fa-send-o', 'fa fa-server', 'fa fa-share', 'fa fa-share-alt', 'fa fa-share-alt-square', 'fa fa-share-square', 'fa fa-share-square-o', 'fa fa-shield', 'fa fa-ship', 'fa fa-shopping-bag', 'fa fa-shopping-basket', 'fa fa-shopping-cart', 'fa fa-shower', 'fa fa-sign-in', 'fa fa-sign-language', 'fa fa-sign-out', 'fa fa-signal', 'fa fa-signing', 'fa fa-sitemap', 'fa fa-sliders', 'fa fa-smile-o', 'fa fa-snowflake-o', 'fa fa-soccer-ball-o', 'fa fa-sort', 'fa fa-sort-alpha-asc', 'fa fa-sort-alpha-desc', 'fa fa-sort-amount-asc', 'fa fa-sort-amount-desc', 'fa fa-sort-asc', 'fa fa-sort-desc', 'fa fa-sort-down', 'fa fa-sort-numeric-asc', 'fa fa-sort-numeric-desc', 'fa fa-sort-up', 'fa fa-space-shuttle', 'fa fa-spinner', 'fa fa-spoon', 'fa fa-square', 'fa fa-square-o', 'fa fa-star', 'fa fa-star-half', 'fa fa-star-half-empty', 'fa fa-star-half-full', 'fa fa-star-half-o', 'fa fa-star-o', 'fa fa-sticky-note', 'fa fa-sticky-note-o', 'fa fa-street-view', 'fa fa-suitcase', 'fa fa-sun-o', 'fa fa-support', 'fa fa-tablet', 'fa fa-tachometer', 'fa fa-tag', 'fa fa-tags', 'fa fa-tasks', 'fa fa-taxi', 'fa fa-television', 'fa fa-terminal', 'fa fa-thermometer', 'fa fa-thermometer-0', 'fa fa-thermometer-1', 'fa fa-thermometer-2', 'fa fa-thermometer-3', 'fa fa-thermometer-4', 'fa fa-thermometer-empty', 'fa fa-thermometer-full', 'fa fa-thermometer-half', 'fa fa-thermometer-quarter', 'fa fa-thermometer-three-quarters', 'fa fa-thumb-tack', 'fa fa-thumbs-down', 'fa fa-thumbs-o-down', 'fa fa-thumbs-o-up', 'fa fa-thumbs-up', 'fa fa-ticket', 'fa fa-times', 'fa fa-times-circle', 'fa fa-times-circle-o', 'fa fa-times-rectangle', 'fa fa-times-rectangle-o', 'fa fa-tint', 'fa fa-toggle-down', 'fa fa-toggle-left', 'fa fa-toggle-off', 'fa fa-toggle-on', 'fa fa-toggle-right', 'fa fa-toggle-up', 'fa fa-trademark', 'fa fa-trash', 'fa fa-trash-o', 'fa fa-tree', 'fa fa-trophy', 'fa fa-truck', 'fa fa-tty', 'fa fa-tv', 'fa fa-umbrella', 'fa fa-universal-access', 'fa fa-university', 'fa fa-unlock', 'fa fa-unlock-alt', 'fa fa-unsorted', 'fa fa-upload', 'fa fa-user', 'fa fa-user-circle', 'fa fa-user-circle-o', 'fa fa-user-o', 'fa fa-user-plus', 'fa fa-user-secret', 'fa fa-user-times', 'fa fa-users', 'fa fa-vcard', 'fa fa-vcard-o', 'fa fa-video-camera', 'fa fa-volume-control-phone', 'fa fa-volume-down', 'fa fa-volume-off', 'fa fa-volume-up', 'fa fa-warning', 'fa fa-wheelchair', 'fa fa-wheelchair-alt', 'fa fa-wifi', 'fa fa-window-close', 'fa fa-window-close-o', 'fa fa-window-maximize', 'fa fa-window-minimize', 'fa fa-window-restore', 'fa fa-wrench']
            ,'可访问性图标' : ['fa fa-american-sign-language-interpreting', 'fa fa-asl-interpreting', 'fa fa-assistive-listening-systems', 'fa fa-audio-description', 'fa fa-blind', 'fa fa-braille', 'fa fa-cc', 'fa fa-deaf', 'fa fa-deafness', 'fa fa-hard-of-hearing', 'fa fa-low-vision', 'fa fa-question-circle-o', 'fa fa-sign-language', 'fa fa-signing', 'fa fa-tty', 'fa fa-universal-access', 'fa fa-volume-control-phone', 'fa fa-wheelchair', 'fa fa-wheelchair-alt']
            ,'手势动作图标' : ['fa fa-hand-grab-o', 'fa fa-hand-lizard-o', 'fa fa-hand-o-down', 'fa fa-hand-o-left', 'fa fa-hand-o-right', 'fa fa-hand-o-up', 'fa fa-hand-paper-o', 'fa fa-hand-peace-o', 'fa fa-hand-pointer-o', 'fa fa-hand-rock-o', 'fa fa-hand-scissors-o', 'fa fa-hand-spock-o', 'fa fa-hand-stop-o', 'fa fa-thumbs-down', 'fa fa-thumbs-o-down', 'fa fa-thumbs-o-up', 'fa fa-thumbs-up']
            ,'交通运输图标' : ['fa fa-ambulance', 'fa fa-automobile', 'fa fa-bicycle', 'fa fa-bus', 'fa fa-cab', 'fa fa-car', 'fa fa-fighter-jet', 'fa fa-motorcycle', 'fa fa-plane', 'fa fa-rocket', 'fa fa-ship', 'fa fa-space-shuttle', 'fa fa-subway', 'fa fa-taxi', 'fa fa-train', 'fa fa-truck', 'fa fa-wheelchair', 'fa fa-wheelchair-alt']
            ,'性别类图标' : ['fa fa-genderless', 'fa fa-intersex', 'fa fa-mars', 'fa fa-mars-double', 'fa fa-mars-stroke', 'fa fa-mars-stroke-h', 'fa fa-mars-stroke-v', 'fa fa-mercury', 'fa fa-neuter', 'fa fa-transgender', 'fa fa-transgender-alt', 'fa fa-venus', 'fa fa-venus-double', 'fa fa-venus-mars']
            ,'文件类型图标' : ['fa fa-file', 'fa fa-file-archive-o', 'fa fa-file-audio-o', 'fa fa-file-code-o', 'fa fa-file-excel-o', 'fa fa-file-image-o', 'fa fa-file-movie-o', 'fa fa-', 'fa fa-file-o', 'fa fa-file-pdf-o', 'fa fa-file-photo-o', 'fa fa-', 'fa fa-file-picture-o', 'fa fa-', 'fa fa-file-powerpoint-o', 'fa fa-file-sound-o', 'fa fa-', 'fa fa-file-text', 'fa fa-file-text-o', 'fa fa-file-video-o', 'fa fa-file-word-o', 'fa fa-file-zip-o']
            ,'旋转类图标' : ['fa fa-circle-o-notch', 'fa fa-cog', 'fa fa-gear', 'fa fa-refresh', 'fa fa-spinner']
            ,'表单提交图标' : ['fa fa-check-square', 'fa fa-check-square-o', 'fa fa-circle', 'fa fa-circle-o', 'fa fa-dot-circle-o', 'fa fa-minus-square', 'fa fa-minus-square-o', 'fa fa-plus-square', 'fa fa-plus-square-o', 'fa fa-square', 'fa fa-square-o']
            ,'网银支付图标' : ['fa fa-cc-amex', 'fa fa-cc-diners-club', 'fa fa-cc-discover', 'fa fa-cc-jcb', 'fa fa-cc-mastercard', 'fa fa-cc-paypal', 'fa fa-cc-stripe', 'fa fa-cc-visa', 'fa fa-credit-card', 'fa fa-credit-card-alt', 'fa fa-google-wallet', 'fa fa-paypal']
            ,'图表类图标' : ['fa fa-area-chart', 'fa fa-bar-chart', 'fa fa-bar-chart-o', 'fa fa-line-chart', 'fa fa-pie-chart']
            ,'货币类图标' : ['fa fa-bitcoin', 'fa fa-btc', 'fa fa-cny', 'fa fa-dollar', 'fa fa-eur', 'fa fa-euro', 'fa fa-gbp', 'fa fa-gg', 'fa fa-gg-circle', 'fa fa-ils', 'fa fa-inr', 'fa fa-jpy', 'fa fa-krw', 'fa fa-money', 'fa fa-rmb', 'fa fa-rouble', 'fa fa-rub', 'fa fa-ruble', 'fa fa-rupee', 'fa fa-shekel', 'fa fa-sheqel', 'fa fa-try', 'fa fa-turkish-lira', 'fa fa-usd', 'fa fa-won', 'fa fa-yen']
            ,'文字编辑器图标' : ['fa fa-align-center', 'fa fa-align-justify', 'fa fa-align-left', 'fa fa-align-right', 'fa fa-bold', 'fa fa-chain ', 'fa fa-chain-broken', 'fa fa-clipboard', 'fa fa-columns', 'fa fa-copy ', 'fa fa-cut ', 'fa fa-dedent ', 'fa fa-eraser', 'fa fa-file', 'fa fa-file-o', 'fa fa-file-text', 'fa fa-file-text-o', 'fa fa-files-o', 'fa fa-floppy-o', 'fa fa-font', 'fa fa-header', 'fa fa-indent', 'fa fa-italic', 'fa fa-link', 'fa fa-list', 'fa fa-list-alt', 'fa fa-list-ol', 'fa fa-list-ul', 'fa fa-outdent', 'fa fa-paperclip', 'fa fa-paragraph', 'fa fa-paste ', 'fa fa-repeat', 'fa fa-rotate-left ', 'fa fa-rotate-right ', 'fa fa-save ', 'fa fa-scissors', 'fa fa-strikethrough', 'fa fa-subscript', 'fa fa-superscript', 'fa fa-table', 'fa fa-text-height', 'fa fa-text-width', 'fa fa-th', 'fa fa-th-large', 'fa fa-th-list', 'fa fa-underline', 'fa fa-undo', 'fa fa-unlink ']
            ,'方向箭头图标' : ['fa fa-angle-double-down', 'fa fa-angle-double-left', 'fa fa-angle-double-right', 'fa fa-angle-double-up', 'fa fa-angle-down', 'fa fa-angle-left', 'fa fa-angle-right', 'fa fa-angle-up', 'fa fa-arrow-circle-down', 'fa fa-arrow-circle-left', 'fa fa-arrow-circle-o-down', 'fa fa-arrow-circle-o-left', 'fa fa-arrow-circle-o-right', 'fa fa-arrow-circle-o-up', 'fa fa-arrow-circle-right', 'fa fa-arrow-circle-up', 'fa fa-arrow-down', 'fa fa-arrow-left', 'fa fa-arrow-right', 'fa fa-arrow-up', 'fa fa-arrows', 'fa fa-arrows-alt', 'fa fa-arrows-h', 'fa fa-arrows-v', 'fa fa-caret-down', 'fa fa-caret-left', 'fa fa-caret-right', 'fa fa-caret-square-o-down', 'fa fa-caret-square-o-left', 'fa fa-caret-square-o-right', 'fa fa-caret-square-o-up', 'fa fa-caret-up', 'fa fa-chevron-circle-down', 'fa fa-chevron-circle-left', 'fa fa-chevron-circle-right', 'fa fa-chevron-circle-up', 'fa fa-chevron-down', 'fa fa-chevron-left', 'fa fa-chevron-right', 'fa fa-chevron-up', 'fa fa-exchange', 'fa fa-hand-o-down', 'fa fa-hand-o-left', 'fa fa-hand-o-right', 'fa fa-hand-o-up', 'fa fa-long-arrow-down', 'fa fa-long-arrow-left', 'fa fa-long-arrow-right', 'fa fa-long-arrow-up', 'fa fa-toggle-down ', 'fa fa-toggle-left ', 'fa fa-toggle-right ', 'fa fa-toggle-up ']
            ,'视频播放器图标' : ['fa fa-arrows-alt', 'fa fa-backward', 'fa fa-compress', 'fa fa-eject', 'fa fa-expand', 'fa fa-fast-backward', 'fa fa-fast-forward', 'fa fa-forward', 'fa fa-pause', 'fa fa-pause-circle', 'fa fa-pause-circle-o', 'fa fa-play', 'fa fa-play-circle', 'fa fa-play-circle-o', 'fa fa-random', 'fa fa-step-backward', 'fa fa-step-forward', 'fa fa-stop', 'fa fa-stop-circle', 'fa fa-stop-circle-o', 'fa fa-youtube-play']
            ,'品牌类图标' : ['fa fa-500px', 'fa fa-adn', 'fa fa-amazon', 'fa fa-android', 'fa fa-angellist', 'fa fa-apple', 'fa fa-bandcamp', 'fa fa-behance', 'fa fa-behance-square', 'fa fa-bitbucket', 'fa fa-bitbucket-square', 'fa fa-bitcoin', 'fa fa-black-tie', 'fa fa-bluetooth', 'fa fa-bluetooth-b', 'fa fa-btc', 'fa fa-buysellads', 'fa fa-cc-amex', 'fa fa-cc-diners-club', 'fa fa-cc-discover', 'fa fa-cc-jcb', 'fa fa-cc-mastercard', 'fa fa-cc-paypal', 'fa fa-cc-stripe', 'fa fa-cc-visa', 'fa fa-chrome', 'fa fa-codepen', 'fa fa-codiepie', 'fa fa-connectdevelop', 'fa fa-contao', 'fa fa-css3', 'fa fa-dashcube', 'fa fa-delicious', 'fa fa-deviantart', 'fa fa-digg', 'fa fa-dribbble', 'fa fa-dropbox', 'fa fa-drupal', 'fa fa-edge', 'fa fa-eercast', 'fa fa-empire', 'fa fa-envira', 'fa fa-etsy', 'fa fa-expeditedssl', 'fa fa-fa', 'fa fa-facebook', 'fa fa-facebook-f', 'fa fa-facebook-official', 'fa fa-facebook-square', 'fa fa-firefox', 'fa fa-first-order', 'fa fa-flickr', 'fa fa-font-awesome', 'fa fa-fonticons', 'fa fa-fort-awesome', 'fa fa-forumbee', 'fa fa-foursquare', 'fa fa-free-code-camp', 'fa fa-ge', 'fa fa-get-pocket', 'fa fa-gg', 'fa fa-gg-circle', 'fa fa-git', 'fa fa-git-square', 'fa fa-github', 'fa fa-github-alt', 'fa fa-github-square', 'fa fa-gitlab', 'fa fa-gittip', 'fa fa-glide', 'fa fa-glide-g', 'fa fa-google', 'fa fa-google-plus', 'fa fa-google-plus-circle', 'fa fa-google-plus-official', 'fa fa-google-plus-square', 'fa fa-google-wallet', 'fa fa-gratipay', 'fa fa-grav', 'fa fa-hacker-news', 'fa fa-houzz', 'fa fa-html5', 'fa fa-imdb', 'fa fa-instagram', 'fa fa-internet-explorer', 'fa fa-ioxhost', 'fa fa-joomla', 'fa fa-jsfiddle', 'fa fa-lastfm', 'fa fa-lastfm-square', 'fa fa-leanpub', 'fa fa-linkedin', 'fa fa-linkedin-square', 'fa fa-linode', 'fa fa-linux', 'fa fa-maxcdn', 'fa fa-meanpath', 'fa fa-medium', 'fa fa-meetup', 'fa fa-mixcloud', 'fa fa-modx', 'fa fa-odnoklassniki', 'fa fa-odnoklassniki-square', 'fa fa-opencart', 'fa fa-openid', 'fa fa-opera', 'fa fa-optin-monster', 'fa fa-pagelines', 'fa fa-paypal', 'fa fa-pied-piper', 'fa fa-pied-piper-alt', 'fa fa-pied-piper-pp', 'fa fa-pinterest', 'fa fa-pinterest-p', 'fa fa-pinterest-square', 'fa fa-product-hunt', 'fa fa-qq', 'fa fa-quora', 'fa fa-ra', 'fa fa-ravelry', 'fa fa-rebel', 'fa fa-reddit', 'fa fa-reddit-alien', 'fa fa-reddit-square', 'fa fa-renren', 'fa fa-resistance', 'fa fa-safari', 'fa fa-scribd', 'fa fa-sellsy', 'fa fa-share-alt', 'fa fa-share-alt-square', 'fa fa-shirtsinbulk', 'fa fa-simplybuilt', 'fa fa-skyatlas', 'fa fa-skype', 'fa fa-slack', 'fa fa-slideshare', 'fa fa-snapchat', 'fa fa-snapchat-ghost', 'fa fa-snapchat-square', 'fa fa-soundcloud', 'fa fa-spotify', 'fa fa-stack-exchange', 'fa fa-stack-overflow', 'fa fa-steam', 'fa fa-steam-square', 'fa fa-stumbleupon', 'fa fa-stumbleupon-circle', 'fa fa-superpowers', 'fa fa-telegram', 'fa fa-tencent-weibo', 'fa fa-themeisle', 'fa fa-trello', 'fa fa-tripadvisor', 'fa fa-tumblr', 'fa fa-tumblr-square', 'fa fa-twitch', 'fa fa-twitter', 'fa fa-twitter-square', 'fa fa-usb', 'fa fa-viacoin', 'fa fa-viadeo', 'fa fa-viadeo-square', 'fa fa-vimeo', 'fa fa-vimeo-square', 'fa fa-vine', 'fa fa-vk', 'fa fa-wechat', 'fa fa-weibo', 'fa fa-weixin', 'fa fa-whatsapp', 'fa fa-wikipedia-w', 'fa fa-windows', 'fa fa-wordpress', 'fa fa-wpbeginner', 'fa fa-wpexplorer', 'fa fa-wpforms', 'fa fa-xing', 'fa fa-xing-square', 'fa fa-y-combinator', 'fa fa-y-combinator-square', 'fa fa-yahoo', 'fa fa-yc', 'fa fa-yc-square', 'fa fa-yelp', 'fa fa-yoast', 'fa fa-youtube', 'fa fa-youtube-play', 'fa fa-youtube-square']
            ,'医疗类图标' : ['fa fa-ambulance', 'fa fa-h-square', 'fa fa-heart', 'fa fa-heart-o', 'fa fa-heartbeat', 'fa fa-hospital-o', 'fa fa-medkit', 'fa fa-plus-square', 'fa fa-stethoscope', 'fa fa-user-md', 'fa fa-wheelchair', 'fa fa-wheelchair-alt']
        };

        var icm_icon_search = {
            '网页应用图标' : ['address-book', 'address-book-o', 'address-card', 'address-card-o', 'adjust', 'american-sign-language-interpreting', 'anchor', 'archive', 'area-chart', 'arrows', 'arrows-h', 'arrows-v', 'asl-interpreting', 'assistive-listening-systems', 'asterisk', 'at', 'audio-description', 'automobile', 'balance-scale', 'ban', 'bank', 'bar-chart', 'bar-chart-o', 'barcode', 'bars', 'bath', 'bathtub', 'battery', 'battery-0', 'battery-1', 'battery-2', 'battery-3', 'battery-4', 'battery-empty', 'battery-full', 'battery-half', 'battery-quarter', 'battery-three-quarters', 'bed', 'beer', 'bell', 'bell-o', 'bell-slash', 'bell-slash-o', 'bicycle', 'binoculars', 'birthday-cake', 'blind', 'bluetooth', 'bluetooth-b', 'bolt', 'bomb', 'book', 'bookmark', 'bookmark-o', 'braille', 'briefcase', 'bug', 'building', 'building-o', 'bullhorn', 'bullseye', 'bus', 'cab', 'calculator', 'calendar', 'calendar-check-o', 'calendar-minus-o', 'calendar-o', 'calendar-plus-o', 'calendar-times-o', 'camera', 'camera-retro', 'car', 'caret-square-o-down', 'caret-square-o-left', 'caret-square-o-right', 'caret-square-o-up', 'cart-arrow-down', 'cart-plus', 'cc', 'certificate', 'check', 'check-circle', 'check-circle-o', 'check-square', 'check-square-o', 'child', 'circle', 'circle-o', 'circle-o-notch', 'circle-thin', 'clock-o', 'clone', 'close', 'cloud', 'cloud-download', 'cloud-upload', 'code', 'code-fork', 'coffee', 'cog', 'cogs', 'comment', 'comment-o', 'commenting', 'commenting-o', 'comments', 'comments-o', 'compass', 'copyright', 'creative-commons', 'credit-card', 'credit-card-alt', 'crop', 'crosshairs', 'cube', 'cubes', 'cutlery', 'dashboard', 'database', 'deaf', 'deafness', 'desktop', 'diamond', 'dot-circle-o', 'download', 'drivers-license', 'drivers-license-o', 'edit', 'ellipsis-h', 'ellipsis-v', 'envelope', 'envelope-o', 'envelope-open', 'envelope-open-o', 'envelope-square', 'eraser', 'exchange', 'exclamation', 'exclamation-circle', 'exclamation-triangle', 'external-link', 'external-link-square', 'eye', 'eye-slash', 'eyedropper', 'fax', 'feed', 'female', 'fighter-jet', 'file-archive-o', 'file-audio-o', 'file-code-o', 'file-excel-o', 'file-image-o', 'file-movie-o', 'file-pdf-o', 'file-photo-o', 'file-picture-o', 'file-powerpoint-o', 'file-sound-o', 'file-video-o', 'file-word-o', 'file-zip-o', 'film', 'filter', 'fire', 'fire-extinguisher', 'flag', 'flag-checkered', 'flag-o', 'flash', 'flask', 'folder', 'folder-o', 'folder-open', 'folder-open-o', 'frown-o', 'futbol-o', 'gamepad', 'gavel', 'gear', 'gears', 'gift', 'glass', 'globe', 'graduation-cap', 'group', 'hand-grab-o', 'hand-lizard-o', 'hand-paper-o', 'hand-peace-o', 'hand-pointer-o', 'hand-rock-o', 'hand-scissors-o', 'hand-spock-o', 'hand-stop-o', 'handshake-o', 'hard-of-hearing', 'hashtag', 'hdd-o', 'headphones', 'heart', 'heart-o', 'heartbeat', 'history', 'home', 'hotel', 'hourglass', 'hourglass-1', 'hourglass-2', 'hourglass-3', 'hourglass-end', 'hourglass-half', 'hourglass-o', 'hourglass-start', 'i-cursor', 'id-badge', 'id-card', 'id-card-o', 'image', 'inbox', 'industry', 'info', 'info-circle', 'institution', 'key', 'keyboard-o', 'language', 'laptop', 'leaf', 'legal', 'lemon-o', 'level-down', 'level-up', 'life-bouy', 'life-buoy', 'life-ring', 'life-saver', 'lightbulb-o', 'line-chart', 'location-arrow', 'lock', 'low-vision', 'magic', 'magnet', 'mail-forward', 'mail-reply', 'mail-reply-all', 'male', 'map', 'map-marker', 'map-o', 'map-pin', 'map-signs', 'meh-o', 'microchip', 'microphone', 'microphone-slash', 'minus', 'minus-circle', 'minus-square', 'minus-square-o', 'mobile', 'mobile-phone', 'money', 'moon-o', 'mortar-board', 'motorcycle', 'mouse-pointer', 'music', 'navicon', 'newspaper-o', 'object-group', 'object-ungroup', 'paint-brush', 'paper-plane', 'paper-plane-o', 'paw', 'pencil', 'pencil-square', 'pencil-square-o', 'percent', 'phone', 'phone-square', 'photo', 'picture-o', 'pie-chart', 'plane', 'plug', 'plus', 'plus-circle', 'plus-square', 'plus-square-o', 'podcast', 'power-off', 'print', 'puzzle-piece', 'qrcode', 'question', 'question-circle', 'question-circle-o', 'quote-left', 'quote-right', 'random', 'recycle', 'refresh', 'registered', 'remove', 'reorder', 'reply', 'reply-all', 'retweet', 'road', 'rocket', 'rss', 'rss-square', 's15', 'search', 'search-minus', 'search-plus', 'send', 'send-o', 'server', 'share', 'share-alt', 'share-alt-square', 'share-square', 'share-square-o', 'shield', 'ship', 'shopping-bag', 'shopping-basket', 'shopping-cart', 'shower', 'sign-in', 'sign-language', 'sign-out', 'signal', 'signing', 'sitemap', 'sliders', 'smile-o', 'snowflake-o', 'soccer-ball-o', 'sort', 'sort-alpha-asc', 'sort-alpha-desc', 'sort-amount-asc', 'sort-amount-desc', 'sort-asc', 'sort-desc', 'sort-down', 'sort-numeric-asc', 'sort-numeric-desc', 'sort-up', 'space-shuttle', 'spinner', 'spoon', 'square', 'square-o', 'star', 'star-half', 'star-half-empty', 'star-half-full', 'star-half-o', 'star-o', 'sticky-note', 'sticky-note-o', 'street-view', 'suitcase', 'sun-o', 'support', 'tablet', 'tachometer', 'tag', 'tags', 'tasks', 'taxi', 'television', 'terminal', 'thermometer', 'thermometer-0', 'thermometer-1', 'thermometer-2', 'thermometer-3', 'thermometer-4', 'thermometer-empty', 'thermometer-full', 'thermometer-half', 'thermometer-quarter', 'thermometer-three-quarters', 'thumb-tack', 'thumbs-down', 'thumbs-o-down', 'thumbs-o-up', 'thumbs-up', 'ticket', 'times', 'times-circle', 'times-circle-o', 'times-rectangle', 'times-rectangle-o', 'tint', 'toggle-down', 'toggle-left', 'toggle-off', 'toggle-on', 'toggle-right', 'toggle-up', 'trademark', 'trash', 'trash-o', 'tree', 'trophy', 'truck', 'tty', 'tv', 'umbrella', 'universal-access', 'university', 'unlock', 'unlock-alt', 'unsorted', 'upload', 'user', 'user-circle', 'user-circle-o', 'user-o', 'user-plus', 'user-secret', 'user-times', 'users', 'vcard', 'vcard-o', 'video-camera', 'volume-control-phone', 'volume-down', 'volume-off', 'volume-up', 'warning', 'wheelchair', 'wheelchair-alt', 'wifi', 'window-close', 'window-close-o', 'window-maximize', 'window-minimize', 'window-restore', 'wrench']
            ,'可访问性图标' : ['american-sign-language-interpreting', 'asl-interpreting', 'assistive-listening-systems', 'audio-description', 'blind', 'braille', 'cc', 'deaf', 'deafness', 'hard-of-hearing', 'low-vision', 'question-circle-o', 'sign-language', 'signing', 'tty', 'universal-access', 'volume-control-phone', 'wheelchair', 'wheelchair-alt']
            ,'手势动作图标' : ['hand-grab-o', 'hand-lizard-o', 'hand-o-down', 'hand-o-left', 'hand-o-right', 'hand-o-up', 'hand-paper-o', 'hand-peace-o', 'hand-pointer-o', 'hand-rock-o', 'hand-scissors-o', 'hand-spock-o', 'hand-stop-o', 'thumbs-down', 'thumbs-o-down', 'thumbs-o-up', 'thumbs-up']
            ,'交通运输图标' : ['ambulance', 'automobile', 'bicycle', 'bus', 'cab', 'car', 'fighter-jet', 'motorcycle', 'plane', 'rocket', 'ship', 'space-shuttle', 'subway', 'taxi', 'train', 'truck', 'wheelchair', 'wheelchair-alt']
            ,'性别类图标' : ['genderless', 'intersex', 'mars', 'mars-double', 'mars-stroke', 'mars-stroke-h', 'mars-stroke-v', 'mercury', 'neuter', 'transgender', 'transgender-alt', 'venus', 'venus-double', 'venus-mars']
            ,'文件类型图标' : ['file', 'file-archive-o', 'file-audio-o', 'file-code-o', 'file-excel-o', 'file-image-o', 'file-movie-o', 'file-o', 'file-pdf-o', 'file-photo-o', 'file-picture-o', 'file-powerpoint-o', 'file-sound-o', 'file-text', 'file-text-o', 'file-video-o', 'file-word-o', 'file-zip-o']
            ,'旋转类图标' : ['circle-o-notch', 'cog', 'gear', 'refresh', 'spinner']
            ,'表单提交图标' : ['check-square', 'check-square-o', 'circle', 'circle-o', 'dot-circle-o', 'minus-square', 'minus-square-o', 'plus-square', 'plus-square-o', 'square', 'square-o']
            ,'网银支付图标' : ['cc-amex', 'cc-diners-club', 'cc-discover', 'cc-jcb', 'cc-mastercard', 'cc-paypal', 'cc-stripe', 'cc-visa', 'credit-card', 'credit-card-alt', 'google-wallet', 'paypal']
            ,'图表类图标' : ['area-chart', 'bar-chart', 'bar-chart-o', 'line-chart', 'pie-chart']
            ,'货币类图标' : ['bitcoin', 'btc', 'cny', 'dollar', 'eur', 'euro', 'gbp', 'gg', 'gg-circle', 'ils', 'inr', 'jpy', 'krw', 'money', 'rmb', 'rouble', 'rub', 'ruble', 'rupee', 'shekel', 'sheqel', 'try', 'turkish-lira', 'usd', 'won', 'yen']
            ,'文字编辑器图标' : ['align-center', 'align-justify', 'align-left', 'align-right', 'bold', 'chain ', 'chain-broken', 'clipboard', 'columns', 'copy ', 'cut ', 'dedent ', 'eraser', 'file', 'file-o', 'file-text', 'file-text-o', 'files-o', 'floppy-o', 'font', 'header', 'indent', 'italic', 'link', 'list', 'list-alt', 'list-ol', 'list-ul', 'outdent', 'paperclip', 'paragraph', 'paste ', 'repeat', 'rotate-left ', 'rotate-right ', 'save ', 'scissors', 'strikethrough', 'subscript', 'superscript', 'table', 'text-height', 'text-width', 'th', 'th-large', 'th-list', 'underline', 'undo', 'unlink ']
            ,'方向箭头图标' : ['angle-double-down', 'angle-double-left', 'angle-double-right', 'angle-double-up', 'angle-down', 'angle-left', 'angle-right', 'angle-up', 'arrow-circle-down', 'arrow-circle-left', 'arrow-circle-o-down', 'arrow-circle-o-left', 'arrow-circle-o-right', 'arrow-circle-o-up', 'arrow-circle-right', 'arrow-circle-up', 'arrow-down', 'arrow-left', 'arrow-right', 'arrow-up', 'arrows', 'arrows-alt', 'arrows-h', 'arrows-v', 'caret-down', 'caret-left', 'caret-right', 'caret-square-o-down', 'caret-square-o-left', 'caret-square-o-right', 'caret-square-o-up', 'caret-up', 'chevron-circle-down', 'chevron-circle-left', 'chevron-circle-right', 'chevron-circle-up', 'chevron-down', 'chevron-left', 'chevron-right', 'chevron-up', 'exchange', 'hand-o-down', 'hand-o-left', 'hand-o-right', 'hand-o-up', 'long-arrow-down', 'long-arrow-left', 'long-arrow-right', 'long-arrow-up', 'toggle-down ', 'toggle-left ', 'toggle-right ', 'toggle-up ']
            ,'视频播放器图标' : ['arrows-alt', 'backward', 'compress', 'eject', 'expand', 'fast-backward', 'fast-forward', 'forward', 'pause', 'pause-circle', 'pause-circle-o', 'play', 'play-circle', 'play-circle-o', 'random', 'step-backward', 'step-forward', 'stop', 'stop-circle', 'stop-circle-o', 'youtube-play']
            ,'品牌类图标' : ['500px', 'adn', 'amazon', 'android', 'angellist', 'apple', 'bandcamp', 'behance', 'behance-square', 'bitbucket', 'bitbucket-square', 'bitcoin', 'black-tie', 'bluetooth', 'bluetooth-b', 'btc', 'buysellads', 'cc-amex', 'cc-diners-club', 'cc-discover', 'cc-jcb', 'cc-mastercard', 'cc-paypal', 'cc-stripe', 'cc-visa', 'chrome', 'codepen', 'codiepie', 'connectdevelop', 'contao', 'css3', 'dashcube', 'delicious', 'deviantart', 'digg', 'dribbble', 'dropbox', 'drupal', 'edge', 'eercast', 'empire', 'envira', 'etsy', 'expeditedssl', 'fa', 'facebook', 'facebook-f', 'facebook-official', 'facebook-square', 'firefox', 'first-order', 'flickr', 'font-awesome', 'fonticons', 'fort-awesome', 'forumbee', 'foursquare', 'free-code-camp', 'ge', 'get-pocket', 'gg', 'gg-circle', 'git', 'git-square', 'github', 'github-alt', 'github-square', 'gitlab', 'gittip', 'glide', 'glide-g', 'google', 'google-plus', 'google-plus-circle', 'google-plus-official', 'google-plus-square', 'google-wallet', 'gratipay', 'grav', 'hacker-news', 'houzz', 'html5', 'imdb', 'instagram', 'internet-explorer', 'ioxhost', 'joomla', 'jsfiddle', 'lastfm', 'lastfm-square', 'leanpub', 'linkedin', 'linkedin-square', 'linode', 'linux', 'maxcdn', 'meanpath', 'medium', 'meetup', 'mixcloud', 'modx', 'odnoklassniki', 'odnoklassniki-square', 'opencart', 'openid', 'opera', 'optin-monster', 'pagelines', 'paypal', 'pied-piper', 'pied-piper-alt', 'pied-piper-pp', 'pinterest', 'pinterest-p', 'pinterest-square', 'product-hunt', 'qq', 'quora', 'ra', 'ravelry', 'rebel', 'reddit', 'reddit-alien', 'reddit-square', 'renren', 'resistance', 'safari', 'scribd', 'sellsy', 'share-alt', 'share-alt-square', 'shirtsinbulk', 'simplybuilt', 'skyatlas', 'skype', 'slack', 'slideshare', 'snapchat', 'snapchat-ghost', 'snapchat-square', 'soundcloud', 'spotify', 'stack-exchange', 'stack-overflow', 'steam', 'steam-square', 'stumbleupon', 'stumbleupon-circle', 'superpowers', 'telegram', 'tencent-weibo', 'themeisle', 'trello', 'tripadvisor', 'tumblr', 'tumblr-square', 'twitch', 'twitter', 'twitter-square', 'usb', 'viacoin', 'viadeo', 'viadeo-square', 'vimeo', 'vimeo-square', 'vine', 'vk', 'wechat', 'weibo', 'weixin', 'whatsapp', 'wikipedia-w', 'windows', 'wordpress', 'wpbeginner', 'wpexplorer', 'wpforms', 'xing', 'xing-square', 'y-combinator', 'y-combinator-square', 'yahoo', 'yc', 'yc-square', 'yelp', 'yoast', 'youtube', 'youtube-play', 'youtube-square']
            ,'医疗类图标' : ['ambulance', 'h-square', 'heart', 'heart-o', 'heartbeat', 'hospital-o', 'medkit', 'plus-square', 'stethoscope', 'user-md', 'wheelchair', 'wheelchair-alt']
        };

        $('.refresh-api-buttons').hide();
        $('#picker').fontIconPicker({
            source: icm_icons,
            searchSource: icm_icon_search,
            // useAttribute: true,
            theme: 'fip-bootstrap',
            // attributeName: icm_icon_search,
            emptyIconValue: 'none'
        });
    })
    function filter(treeId, parentNode, childNodes) {
        if (!childNodes) return null;
        for (var i=0, l=childNodes.length; i<l; i++) {
            childNodes[i].menuName = childNodes[i].menuName.replace(/\.n/g, '.');
        }
        return childNodes;
    }

    $('#treegrid').treegrid({
         url:'/system/menu/dynamicTree?parentId=0'
        ,idField:'id'
        ,treeField:'menuName'
        ,parentField:'parentId'
        ,rownumbers:'true'
        ,cascadeCheck:"true"
        ,fit:"true"
        ,fitColumns:"true"
        ,emptyMsg:'<span>没有数据!</span>'
        ,singleSelect:true
        ,onBeforeExpand:function(row){
            //动态设置展开查询的url
            $(this).treegrid('options').url = '/system/menu/dynamicTree?parentId='+row.id;
        }
    });
    
    function menuIcon(value, row, index) {
        if(row.menuIcon){
            return '<i class="'+row.menuIcon+'"></i>'
        }
    }
    
    function add() {
        $('#dlg').dialog('open').dialog('setTitle','添加');
        $('#fm').form('clear');
        url = '/system/menu/insert';
    }

    function upd() {
        var row = $('#treegrid').treegrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('setTitle','修改');
            $('#fm').form('load',row);
            url = '/system/menu/update?id='+row.id;
        }
    }

    function save(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                // var result = eval('('+result+')');
                if (result != "1"){
                    $.messager.show({
                        title: 'Error',
                        msg: result.errorMsg
                    });
                } else {
                    $('#dlg').dialog('close');
                    $('#treegrid').treegrid('reload');
                }
            }
        });
    }

    $('#tt').combotree({
         url: '/system/menu/getMenu'
        ,checkbox: true
        ,cascadeCheck: true
        ,idField:'id'
        ,treeField:'menuName'
        ,parentField:'parentId'
    });
</script>
</body>
</html>