package org.paasta.caas.dashboard.node.support;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * NodeData model 클래스
 *
 * @author Hyungu Cho
 * @version 1.0
 * @since 2018.08.17
 */
@Data
public class NodeStatus {
    private Map<String, Object> capacity;
    private Map<String, Object> allocatable;

    // TODO : Map<String, Object> to CommonCondition?
    private List<Map<String, Object>> conditions;

//    private List<Map<String, Object>> addresses;
//    private Map<String, Object> daemonEndpoints;
//    private Map<String, Object> nodeInfo;
//    private Map<String, Object> images;
}
