package org.paasta.caas.dashboard.node;

import lombok.Data;

import java.util.List;

/**
 * Node List Model 클래스
 *
 * @author REX
 * @version 1.0
 * @since 2018.08.13
 */
@Data
public class NodeList {
    private String resultCode;
    private String resultMessage;

    private List<Node> items;
}
