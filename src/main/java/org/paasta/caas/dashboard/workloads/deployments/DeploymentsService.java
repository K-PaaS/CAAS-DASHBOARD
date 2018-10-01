package org.paasta.caas.dashboard.workloads.deployments;

import org.paasta.caas.dashboard.common.Constants;
import org.paasta.caas.dashboard.common.RestTemplateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

/**
 * Deployments Service 클래스
 *
 * @author Hyungu Cho
 * @version 1.0
 * @since 2018.08.14
 */
@Service
public class DeploymentsService {

    private final RestTemplateService restTemplateService;

    @Autowired
    public DeploymentsService(RestTemplateService restTemplateService) {
        this.restTemplateService = restTemplateService;
    }


    /**
     * Deployments 목록을 조회한다.
     * @param namespace   the namespace
     * @return the deployments list
     */
    public DeploymentsList getDeploymentsList (String namespace ) {
        return restTemplateService.send( Constants.TARGET_CAAS_API,
                Constants.URI_API_DEPLOYMENTS_LIST
                        .replace( "{namespace:.+}", namespace ),
                HttpMethod.GET, null, DeploymentsList.class);
    }


    /**
     * Deployments 상세 정보를 조회한다.
     *
     * @param namespace   the namespace
     * @param deploymentsName the deployments name
     * @return the deployments
     */
    public Deployments getDeployments (String namespace, String deploymentsName ) {
        return restTemplateService.send(Constants.TARGET_CAAS_API, Constants.URI_API_DEPLOYMENTS_DETAIL
                    .replace( "{namespace:.+}", namespace )
                    .replace( "{deploymentsName:.+}", deploymentsName )
                , HttpMethod.GET, null, Deployments.class);
    }


    /**
     * Deployments YAML을 조회한다.
     *
     * @param namespace   the namespace
     * @param deploymentsName the deployments name
     * @return the deployments yaml
     */
    Deployments getDeploymentsYaml(String namespace, String deploymentsName) {
        return restTemplateService.send(Constants.TARGET_CAAS_API, Constants.URI_API_DEPLOYMENTS_YAML
                        .replace("{namespace:.+}", namespace)
                        .replace("{deploymentsName:.+}", deploymentsName),
                HttpMethod.GET, null, Deployments.class);
    }


    /**
     * Deployments 목록을 조회한다. (Label Selector)
     *
     * @param namespace the namespace
     * @param selectors the selectors
     * @return the deployments list
     */
     DeploymentsList getDeploymentsListLabelSelector(String namespace, String selectors) {
        String reqUrl = Constants.URI_API_DEPLOYMENTS_RESOURCES.replace("{namespace:.+}", namespace)
                                                                .replace("{selector:.+}", selectors);
        return restTemplateService.send(Constants.TARGET_CAAS_API, reqUrl, HttpMethod.GET, null, DeploymentsList.class);
    }
}
