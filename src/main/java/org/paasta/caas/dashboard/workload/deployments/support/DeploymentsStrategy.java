package org.paasta.caas.dashboard.workload.deployments.support;

import lombok.Data;

/**
 * DeploymentsStrategy Model 클래스
 *
 * @author Hyungu Cho
 * @version 1.0
 * @since 2018.08.13
 */
@Data
public class DeploymentsStrategy {
    private String type;

    private RollingUpdateDeployments rollingUpdate;
}
