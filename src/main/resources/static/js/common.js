var form = layui.form;
var layer = layui.layer;
var $ = layui.jquery;
var element = layui.element;
var laypage = layui.laypage;
var upload = layui.upload;
var laydate = layui.laydate;
var table = layui.table;
// var treeGrid = layui.treeGrid;

function goLogout() {
	openConfirm(function(index) {
		layer.close(index);
		location.href = "/logout";
	}, '您确定注销？');
}

function sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}
function openConfirm(func, title) {
	title = title ? title : "确定进行该操作？";
	layer.confirm(title, {
		icon : 3,
		title : '提示'
	}, func);
}

laydate.render({
    elem: '#test1'
  });

layui.config({
	  version: '1527693307626' //为了更新 js 缓存，可忽略
});

function formSubmit(url, submit, dataType, func) {
	form.on(submit, function(data) {
		ajax(url, data.field, dataType, func);
        return false;
	});
}
function ajax(url, data, dataType, func) {
	$.ajax({
		url : url,
		data : data,
		dataType : dataType,
		type : 'POST',
		success : func
	});
}
function openLayer(url, end) {
	layer.open({
		type : 2,
		area : [ '800px', '450px' ],
		fixed : false, // 不固定
		maxmin : true,
		end : end,
		content : url
	});
}
function closeThis(time) {
	time = time ? time : 200;
	setTimeout(function() {
		// 先得到当前iframe层的索引
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}, time)
}

function close(href,time) {
	time = time ? time : 200;
	setTimeout(function() {
		location.href = con.app + "/mis/href.do?href="+href;
	}, time)
}

function Operate(href,id){
	location.href = con.app + '/mis/href.do?href='+href+'&id='+id;
}

function setPageInfo(elem, count, curr, limit, jump) {
	laypage.render({
		elem : elem,
		count : count,
		curr : curr,
		limit : limit,
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
		jump : jump
	});
}
