var procCallAjax = function(reqUrl, reqMethod, param, preFunc, callback) {
    var reqData = "";
    if (param != null) {
        reqData = param;
    }
    $.ajax({
        url: reqUrl,
        method: reqMethod,
        data: reqData,
        dataType: 'json',
        async: false,
        contentType: "application/json",
        beforeSend: function(){
            ///preFunc
        },
        success: function(data) {
            callback(data);
        },
        error: function(xhr, status, error) {
            //alert("api error message");
        },
        complete : function(data) {
            // SKIP
            console.log("COMPLETE :: data :: ", data);
        }
    });
};


// MOVE PAGE
var procMovePage = function (pageUrl) {
    if (pageUrl === null || pageUrl.length < 1) {
        return false;
    }

    if ((!!pageUrl && typeof pageUrl === 'number') && -1 === pageUrl) {
        history.back();
    } else {
        // pageUrl = ("/" === pageUrl) ? "" : pageUrl;
        // location.href = procGetDashboardUrl() + pageUrl;
        location.href = pageUrl;
    }

};


// GET DASHBOARD URL
var procGetDashboardUrl = function () {
    var currentUrl = location.pathname;
    var splitString = "/";
    var splits = currentUrl.split(splitString);

    return splitString + splits[1] + splitString + splits[2];
};


// SET SELECTOR
var procSetSelector = function (requestMapString) {
    if (requestMapString === null || requestMapString.length < 1) {
        return false;
    }

    return JSON.stringify(requestMapString).replace(/["{}]/g, '').replace(/:/g, '=');
};


/**
 * 문자열이 빈 문자열인지 체크하여 빈값("")으로 한다.
 * @param str           : 체크할 문자열
 */
function nvl(str){
    if(typeof str === "undefined" || str == null || str === "null" || str === ""){
        str = "";
    }
    return str;
}

/**
 * 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다.
 * @param str           : 체크할 문자열
 * @param defaultStr    : 문자열이 비어있을경우 리턴할 기본 문자열
 */
function nvl2(str, defaultStr){
    if(typeof str === "undefined" || str == null || str === "null" || str === "")
        str = defaultStr ;
    return str ;
}


// SET MENU CURSOR
var procSetMenuCursor = function () {
    var leftMenuList = ["clusters", "workloads", "services", "accessInfo", "users", "roles"];
    var headerMenuList = ["accessInfo", "users", "roles"];
    var leftMenuListLength = leftMenuList.length;
    var calledMenu = leftMenuList[0];

    var currentUrl = location.pathname;
    var splitString = "/";
    var splits = currentUrl.split(splitString);
    var splitsLength = splits.length;

    for (var i = 0; i < leftMenuListLength; i++) {
        for (var j = 0; j < splitsLength; j++) {
            if (leftMenuList[i] === splits[j]) {
                calledMenu = leftMenuList[i];

                if (headerMenuList.includes(splits[j])) {
                    $("#header-menu-" + calledMenu).addClass('cur');
                }
            }
        }
    }

    $("#left-menu-" + calledMenu).addClass('cur');
};


// SET SORT LIST
var procSetSortList = function(resultTableString, buttonObject, key) {
    var resultTable = $('#' + resultTableString);
    var orderDigit = ($(buttonObject).hasClass('sort')) ? 0 : 1; // 0 = ASC, 1 = DESC
    var sorting = [[key, orderDigit]];

    resultTable.tablesorter();
    resultTable.trigger("update");
    resultTable.trigger("sorton", [sorting]);
};


var checkValidData = function (data) {
    if (RESULT_STATUS_FAIL === data.resultCode) {
        console.log("ResultStatus :: " + data.resultCode + " / " + "ResultMessage :: " + data.resultMessage);
        return false;
    } else {
        return true;
    }
}

var processIfDataIsNull = function (data, procCallback, defaultValue) {
    if (data == null)
        return defaultValue;
    else {
        if (procCallback == null)
            return defaultValue;
        else
            return procCallback(data);
    }
}


var sortTable = function (tableId, sortKey, isAscending=true) {
    var _tbody = $('#' + tableId + ' > tbody');
    var _rows = _tbody.children('tr');
    _rows.sort(function (rowA, rowB) {
        var _reverseNumber = (isAscending)? 1 : -1;
        var _compareA = $(rowA).attr(sortKey);
        var _compareB = $(rowB).attr(sortKey);
        if (_compareA == _compareB)
            return 0;
        else {
            if (_compareA == null)
                return -1 * _reverseNumber;
            else if (_compareB == null)
                return 1 * _reverseNumber;
            else if (_compareA > _compareB)
                return 1 * _reverseNumber;
            else
                return -1 * _reverseNumber;
        }
    });
    _tbody.html(_rows);
}

var convertByte = function(capacity) {
    var _multipleSize;
    if (capacity.match("Ki").index != -1) {
        _multipleSize = 1024;
    } else if (capacity.match("Mi").index != -1) {
        _multipleSize = 1024 * 1024;
    } else if (capacity.match("Gi").index != -1) {
        _multipleSize = 1024 * 1024 * 1024;
    } else {
        _multipleSize = 1;
    }

    return capacity.substring(0, capacity.length - 2) * _multipleSize;
}

var formatCapacity = function(capacity, unit) {
    var _unitSize;
    if (unit == null || "" == unit)
        _unitSize = 1;
    else {
        if (unit === "Ki")    _unitSize = 1024
        if (unit === "Mi")    _unitSize = Math.pow(1024, 2);
        if (unit === "Gi")    _unitSize = Math.pow(1024, 3);
    }

    return ((capacity / _unitSize).toFixed(2) + ' ' + unit);
}

var getURLInfo = function () {
    // THIS FUNCTION IS FOR tab.jsp
    // ex) slices = [ "workloads", "pods", "<pod-name>", "events"]
    // ex) slices = [ "clusters", "nodes", "<node-name>", "summary"]
    var _urlSplits = window.location.href.replace(/\?.*/, '').split('/');
    var _slices = _urlSplits.splice(_urlSplits.indexOf("caas") + 1, _urlSplits.length - _urlSplits.indexOf("caas"));

    var _valueFrame = {
        category: _slices[0],
        page: _slices[1]
    };

    // resource is resource name (ex: node name, pod name, deployment name, et al.)
    if (_slices.length > 2)
        _valueFrame['resource'] = _slices[2];

    if (_slices.length > 3)
        _valueFrame['tab'] = _slices[3];
    else
        _valueFrame['tab'] = '_default';

    return _valueFrame;
};

/*
var stringifyJSON = function (obj) {
    return JSON.stringify(obj).replace(/["{}]/g, '').replace(/:/g, '=');
}
*/
