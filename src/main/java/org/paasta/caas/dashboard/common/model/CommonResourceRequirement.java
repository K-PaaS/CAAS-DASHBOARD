package org.paasta.caas.dashboard.common.model;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

import java.util.Map;

/**
 * CommonResourceRequirement Model 클래스
 *
 * @author Hyungu Cho
 * @version 1.0
 * @since 2018.08.16
 */
@Data
public class CommonResourceRequirement {
    /* ResourceRequirement -- START */
    @SerializedName("limits")
    Map<String, String> limits;

    @SerializedName("requests")
    Map<String, String> requests;
    /* ResourceRequirement -- END   */
}
