<%--
  Deployments main
  @author Hyungu Cho
  @version 1.0
  @since 2018.08.14
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="content">
    <jsp:include page="commonNodes.jsp"/>

    <%-- NODES HEADER INCLUDE --%>
    <jsp:include page="../common/contentsTab.jsp" flush="true"/>

    <!-- Nodes Details 시작-->
    <div class="cluster_content02 row two_line two_view harf_view">
        <ul class="maT30">
            <li class="cluster_first_box" id="nodeDetailNotFound" style="display:none;">Node의 정보를 가져오지 못했습니다.</li>
            <li class="cluster_first_box">
                <div class="sortable_wrap">
                    <div class="sortable_top">
                        <p>Details</p>
                    </div>
                    <div class="account_table view">
                        <table>
                            <colgroup>
                                <col style="width:20%">
                                <col style=".">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th><i class="cWrapDot"></i> Name</th>
                                <td id="node_name"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Labels</th>
                                <td id="node_labels" class="labels_wrap"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Annotations</th>
                                <td id="node_annotations" class="labels_wrap"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Creation Time</th>
                                <td id="node_created_at"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Addresses</th>
                                <td id="node_addresses" class="labels_wrap"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Pod CIDR</th>
                                <td id="node_pod_cidr"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Unschedulable</th>
                                <td id="node_unschedulable"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
            <li class="cluster_second_box maB50">
                <div class="sortable_wrap">
                    <div class="sortable_top">
                        <p>System info</p>
                    </div>
                    <div class="account_table view">
                        <table>
                            <colgroup>
                                <col style="width:20%">
                                <col style=".">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th><i class="cWrapDot"></i> Machine ID</th>
                                <td id="node_machine_id"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> System UUID</th>
                                <td id="node_system_uuid"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Boot ID</th>
                                <td id="node_boot_id"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Kernel Version</th>
                                <td id="node_kernel_version"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> OS Images</th>
                                <td id="node_images"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Container Runtime Version</th>
                                <td id="node_container_version"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Kubelet version</th>
                                <td id="node_kubenet_version"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Kube-Proxy Version</th>
                                <td id="node_kubeproxy_version"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Operation system</th>
                                <td id="node_os_name"></td>
                            </tr>
                            <tr>
                                <th><i class="cWrapDot"></i> Architecture</th>
                                <td id="node_architecture"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    var setLayerpop = function (eventElement) {
        var select = $(eventElement);
        var _title = select.data('title');
        if (_title instanceof Object) {
            _title = JSON.stringify(_title);
        }

        var _content = select.data('content');
        if (_content instanceof Object) {
            _content = '<p>' + JSON.stringify(_content) + '</p>';
        } else {
            _content = '<p>' + _content + '</p>';
        }

        $('.modal-title').html(_title);
        $('.modal-body').html(_content);
    };

    var createSpans = function (inputData, type) {
        var data = inputData.replace(/=/g, ':').split(/,\s/);
        var spanHtml = "";

        $.each(data, function (index, item) {
            if (type === "true" && index > 0)
                spanHtml += '<br>';

            var htmlString = null;
            var separatorIndex = item.indexOf(": ");
            if (separatorIndex > 0) {
                var _title = item.substring(0, separatorIndex);
                var _content = item.substring(separatorIndex + 2);
                try {
                    var test = JSON.parse(_content);    // JSON object test only
                    if (test instanceof Object || test instanceof Array) {
                        htmlString = $('<span class="bg_blue" onclick="setLayerpop(this)" data-target="#layerpop3" data-toggle="modal" '
                            + 'data-title="' + _title + '"><a>' + _title + '</a></span> ')
                            .attr('data-content', _content).wrapAll("<div/>").parent().html();
                    }
                } catch(e) { };
            }

            if (null == htmlString)
                htmlString = '<span class="bg_gray">' + item.replace(": ", ":") + '</span>';

            spanHtml += (htmlString +  ' ');
        });

        return spanHtml;
    };

    var stringifyKeyValue = function (data, mapFunc) {
        if (data instanceof Array) {
            if (null == mapFunc)
                arrayFunc = function(index, item) { return item };

            return data.map(mapFunc).reduce(function(prevItem, item) { return prevItem + ", " + item; });
        } else {
            return Object.keys(data).map( function (key) { return key + ": " + data[key]; })
                .reduce(function(prevItem, item) { return prevItem + ", " + item; });
        }
    };

    var callbackGetNodeDetail = function (data) {
        viewLoading('show');

        if (false === procCheckValidData(data)) {
            viewLoading('hide');
            alertMessage("Node 정보를 가져오지 못했습니다.", false);
            $("#nodeDetailNotFound").show();
            return;
        }

        var _metadata = data.metadata;
        var _spec = data.spec;
        var _status = data.status;

        // name, labels, annotations, created-at, addresses, pod-cidr, unschedulable
        var name = _metadata.name;
        var labels = stringifyKeyValue(_metadata.labels);
        var annotations = stringifyKeyValue(_metadata.annotations);
        var createdAt = _metadata.creationTimestamp;
        var addresses = stringifyKeyValue(_status.addresses, function(item) { return item.type + ": " + item.address; });
        var podCIDR = _spec.podCIDR;
        var unschedulable = _spec.taints != null?
            _spec.taints.filter(
                function(item) { return item.key === 'node-role.kubernetes.io/master' && item.effect !== 'NoSchedule'; }).length > 0 : false;

        // get datum : system info
        var nodeInfo = _status.nodeInfo;
        var machineId = nodeInfo.machineID;
        var systemUUID = nodeInfo.systemUUID;
        var bootID = nodeInfo.bootID;
        var kernalVersion = nodeInfo.kernelVersion;
        var osImages = nodeInfo.osImage;
        var containerRuntimeVersion = nodeInfo.containerRuntimeVersion;
        var kubeletVersion = nodeInfo.kubeletVersion;
        var kubeProxyVersion = nodeInfo.kubeProxyVersion;
        var operatingSystem = nodeInfo.operatingSystem;
        var architecture = nodeInfo.architecture;

        $('#node_name').html(name);
        $('#node_labels').html(createSpans(labels, "false"));
        $('#node_annotations').html(createSpans(annotations, "false"));
        $('#node_created_at').html(createdAt);
        $('#node_addresses').html(createSpans(addresses, "false"));
        $('#node_pod_cidr').html(podCIDR);
        $('#node_unschedulable').html(unschedulable.toString());

        $('#node_machine_id').html(machineId);
        $('#node_system_uuid').html(systemUUID);
        $('#node_boot_id').html(bootID);
        $('#node_kernel_version').html(kernalVersion);
        $('#node_images').html(osImages);
        $('#node_container_version').html(containerRuntimeVersion);
        $('#node_kubenet_version').html(kubeletVersion);
        $('#node_kubeproxy_version').html(kubeProxyVersion);
        $('#node_os_name').html(operatingSystem);
        $('#node_architecture').html(architecture);

        viewLoading('hide');
    };

    $(document.body).ready(function () {
        viewLoading('show');
        getNode(G_NODE_NAME, callbackGetNodeDetail);
        viewLoading('hide');
    });
</script>
<!-- Nodes Details 끝 -->
