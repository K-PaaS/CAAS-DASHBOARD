package org.paasta.caas.dashboard.common.model;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

/**
 * Common CommonOwnerReferences Model 클래스
 *
 * @author hyerin
 * @version 1.0
 * @since 2018.09.19
 */
@Data
public class CommonOwnerReferences {
    @SerializedName(value = "name")
    private String name;

    @SerializedName(value = "controller")
    private boolean controller;
}
