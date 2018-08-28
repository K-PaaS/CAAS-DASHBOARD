<%--
  Roles main

  author: hrjin
  version: 1.0
  since: 2018-08-16
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="content">
    <div class="cluster_tabs clearfix"></div>
    <div class="cluster_content01 row two_line two_view">
        <ul>
            <li class="cluster_first_box">
                <div class="sortable_wrap">
                    <div class="sortable_top role">
                        <p>Administrator</p>
                    </div>
                    <div class="account_table view">
                        <ul class="role-list">
                            <li>
                                <input id="role-list-get-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-get-admin">Get</label>
                            </li>
                            <li>
                                <input id="role-list-list-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-list-admin">List</label>
                            </li>
                            <li>
                                <input id="role-list-create-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-create-admin">Create</label>
                            </li>
                            <li>
                                <input id="role-list-delete-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-delete-admin">Delete</label>
                            </li>
                            <li>
                                <input id="role-list-update-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-update-admin">Update</label>
                            </li>
                            <li>
                                <input id="role-list-patch-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-patch-admin">Patch</label>
                            </li>
                            <li>
                                <input id="role-list-watch-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-watch-admin">Watch</label>
                            </li>
                            <li>
                                <input id="role-list-manage-admin" type="checkbox" checked="checked" disabled />
                                <label for="role-list-manage-admin">User Management</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="cluster_second_box">
                <div class="sortable_wrap">
                    <div class="sortable_top role">
                        <p>Regular User</p>
                    </div>
                    <div class="account_table view">
                        <ul class="role-list">
                            <li>
                                <input id="role-list-get-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-get-regular">Get</label>
                            </li>
                            <li>
                                <input id="role-list-list-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-list-regular">List</label>
                            </li>
                            <li>
                                <input id="role-list-create-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-create-regular">Create</label>
                            </li>
                            <li>
                                <input id="role-list-delete-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-delete-regular">Delete</label>
                            </li>
                            <li>
                                <input id="role-list-update-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-update-regular">Update</label>
                            </li>
                            <li>
                                <input id="role-list-patch-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-patch-regular">Patch</label>
                            </li>
                            <li>
                                <input id="role-list-watch-regular" type="checkbox" checked="checked" disabled />
                                <label for="role-list-watch-regular">Watch</label>
                            </li>
                            <li>
                                <input id="role-list-manage-regular" type="checkbox" disabled />
                                <label for="role-list-manage-regular">User Management</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="cluster_third_box">
                <div class="sortable_wrap">
                    <div class="sortable_top role">
                        <p>Init User</p>
                    </div>
                    <div class="account_table view">
                        <ul class="role-list">
                            <li>
                                <input id="role-list-get-init" type="checkbox" checked="checked" disabled />
                                <label for="role-list-get-init">Get</label>
                            </li>
                            <li>
                                <input id="role-list-list-init" type="checkbox" checked="checked" disabled />
                                <label for="role-list-list-init">List</label>
                            </li>
                            <li>
                                <input id="role-list-create-init" type="checkbox" disabled />
                                <label for="role-list-create-init">Create</label>
                            </li>
                            <li>
                                <input id="role-list-delete-init" type="checkbox" disabled />
                                <label for="role-list-delete-init">Delete</label>
                            </li>
                            <li>
                                <input id="role-list-update-init" type="checkbox" disabled />
                                <label for="role-list-update-init">Update</label>
                            </li>
                            <li>
                                <input id="role-list-patch-init" type="checkbox" disabled />
                                <label for="role-list-patch-init">Patch</label>
                            </li>
                            <li>
                                <input id="role-list-watch-init" type="checkbox" checked="checked" disabled />
                                <label for="role-list-watch-init">Watch</label>
                            </li>
                            <li>
                                <input id="role-list-manage-init" type="checkbox" disabled />
                                <label for="role-list-manage-init">User Management</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>


<%--TODO :: REMOVE--%>
<div style="padding: 10px;">
    ROLE 대시보드 :: ROLE DASHBOARD
    <div style="padding: 10px;">
        <button type="button" id="btnSearch"> [ 조회 ] </button>
        <button type="button" id="btnReset"> [ 초기화 ] </button>
    </div>
    <h1>RESULT</h1>
    <div id="resultArea" style="width: 98%; height: auto; min-height: 100px; padding: 10px; margin: 1%; border: dotted green 4px;">
    </div>
</div>
<script type="text/javascript">

    // GET LIST
    var getRoleList = function() {
        procCallAjax("/roles/getList.do", "GET", null, null, callbackGetRoleList);
    };

    var callbackGetRoleList = function (data) {
        if (RESULT_STATUS_FAIL === data.resultStatus) return false;

        //console.log("델리스파이스", JSON.stringify(data));

        var items = data.items;
        var roleName;
        var namespace;
        var metadata;
        var listLength = items.length;
        var htmlString = [];

        htmlString.push("Role List :: <br><br>");

        for(var i = 0; i < listLength; i++){
            metadata = items[i].metadata;
            roleName = metadata.name;
            namespace = metadata.namespace;

            htmlString.push(
                "<a href='javascript:void(0);' onclick='procMovePage(\"/caas/roles/" + roleName + "\");'><span style='color: orangered;'>[ DETAIL ]</span></a>" + " || "
                + "name :: " + roleName + " || "
                + "namespace :: " + namespace + " || "
                + "creationTimestamp :: " + items[i].metadata.creationTimestamp
                + "<br><br>");
        }

        $('#resultArea').html(htmlString);
    };

    // BIND
    $("#btnSearch").on("click", function() {
        getRoleList();
    });


    // BIND
    $("#btnReset").on("click", function() {
        $('#resultArea').html("");
    });

    // ON LOAD
    $(document.body).ready(function () {
        // getRoleList();
    });
</script>