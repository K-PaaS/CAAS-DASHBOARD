package org.paasta.caas.dashboard.customService;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Custom Service List Model 클래스
 *
 * @author REX
 * @version 1.0
 * @since 2018.8.09
 */
@Data
public class CustomServiceList {

    private String resultCode;
    private String resultMessage;

    private List<CustomService> items = new ArrayList<>();

}
