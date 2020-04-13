function ajaxJsonRequest(method, url, jsonData, handleData) {
    $.ajax({
        type : method,
        url : url,
        data : jsonData,
        dataType : "json",
        contentType : "application/json; charset=utf-8",
        success : handleData,
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
    return false;
}

function ajaxGetRequest(url, id, handleData) {
    $.ajax({
        type : "GET",
        url : url + "?id=" + id,
        dataType : "json",
        contentType : "application/json; charset=utf-8",
        success : handleData,
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
    return false;
}

function ajaxFormRequest(method, url, formData, handleData) {
    $.ajax({
        type : method,
        url : url,
        data : formData,
        contentType : false,
        processData : false,
        cache : false,
        success : handleData,
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
    return false;
}

/* 提交表单数据 */
$(document).on("click", ".ajax-submit", function (e) {
    e.preventDefault();
    var form = $(this).parents("form");
    var url = form.attr("action");
    var serializeArray = form.serializeArray();
    $.post(url, serializeArray, function (result) {
        if (result.data == null) {
            result.data = 'submit[refresh]';
        }
        $.fn.Messager(result);
    });
});

/* 关闭弹出层 */
$(".close-popup").click(function (e) {
    e.preventDefault();
    parent.layer.close(window.parent.layerIndex);
});