package org.paasta.caas.dashboard.endpoint;

import lombok.Data;
import org.paasta.caas.dashboard.common.model.CommonMetaData;
import org.paasta.caas.dashboard.common.model.CommonSpec;
import org.paasta.caas.dashboard.common.model.CommonStatus;
import org.paasta.caas.dashboard.common.model.CommonSubsets;

import java.util.List;

/**
 * Endpoint Model 클래스
 *
 * @author REX
 * @version 1.0
 * @since 2018.08.13
 */
@Data
public class Endpoint {

    private String resultCode;
    private String resultMessage;

    private CommonMetaData metadata;
    private CommonSpec spec;
    private CommonStatus status;
    private List<CommonSubsets> subsets;

    // FOR DASHBOARD
    private String serviceName;

}
