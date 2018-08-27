package org.paasta.caas.dashboard.workload.deployments;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Deployments List Model 클래스
 *
 * @author Hyungu Cho
 * @version 1.0
 * @since 2018.08.13
 */
@Data
public class DeploymentsList {
    private String resultCode;
    private String resultMessage;

    private List<Deployments> items = new ArrayList<>();
}