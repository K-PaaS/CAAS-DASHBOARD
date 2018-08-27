package org.paasta.caas.dashboard.common.model;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

import java.util.Map;

/**
 * Replicaset Model 클래스
 *
 * @author 최윤석
 * @version 1.0
 * @since 2018.08.07
 */
@Data
public class CommonLabelSelector {

    @SerializedName("matchLabels")
    private Map<String, String> matchLabels;

    //@SerializedName("matchExpressions")
    //private List<V1LabelSelectorRequirement> matchExpressions = null;
}
