package org.paasta.caas.dashboard.clusters.persistentVolumes;

import lombok.Data;
import org.paasta.caas.dashboard.common.model.CommonMetaData;

import java.util.ArrayList;
import java.util.List;

/**
 * persistentvolume Model 클래스
 *
 * @author 최윤석
 * @version 1.0
 * @since 2018.08.07
 */
@Data
public class PersistentVolumesList {

//    private String kind = null;
//    private String apiVersion = null;
    private CommonMetaData metadata;
    private List<PersistentVolumes> items = new ArrayList<>();

    private String resultCode;
    private String resultMessage;
}