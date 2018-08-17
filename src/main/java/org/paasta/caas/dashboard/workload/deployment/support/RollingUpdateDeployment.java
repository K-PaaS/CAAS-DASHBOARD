package org.paasta.caas.dashboard.workload.deployment.support;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

/**
 * RollingUpdateDeployment
 *
 * @author Hyungu Cho
 * @version 1.0
 * @since 2018.08.13
 */
@Data
public class RollingUpdateDeployment {
    private String maxSurge;

    private String maxUnavailable;
}
